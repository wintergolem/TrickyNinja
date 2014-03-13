//Author: Richard Pieterse
//Date: 16 May 2013
//Email: Merrik44@live.com
//Last Edited by: Steven Hoover

using UnityEngine;
using System.Collections;
using System.Collections.Generic;

namespace GamepadInput
{
	class controllerBools
	{
		public int index;
		public bool bLeftTriggerDownLastCheckGBU;		//get button up
		public bool bRightTriggerDownLastCheckGBU;		//get button up
		public bool bLeftTriggerDownLastCheckGBD;		//get button down
		public bool bRightTriggerDownLastCheckGBD;		//get button down


	}
    public static class GamePad
    {
		static bool bStructsSet = false;
		static List<controllerBools> lcb;
		static int iActiveIndexListCB;
		public enum Button { A, B, Y, X, RightShoulder, LeftShoulder, RightStick, LeftStick, Back, Start , LeftTrigger, RightTrigger }
        public enum Trigger { LeftTrigger, RightTrigger }
        public enum Axis { LeftStick, RightStick, Dpad }
        public enum Index { Any, One, Two, Three, Four }

        public static bool GetButtonDown(Button button, Index controlIndex)
        {
			if (!bStructsSet) 
			{
				SetAllStructToZero ();
				bStructsSet = true;
			}
			GrabCorrectStruct (controlIndex);
			if (button == Button.LeftTrigger) 
			{
				if( GetTrigger( Trigger.LeftTrigger , controlIndex ) == 1 )
				{
					//trigger is down
					if( lcb[ iActiveIndexListCB ].bLeftTriggerDownLastCheckGBD )
					{
						//button down last check, so it wasn't pressed this check
						return false;
					}
					else
					{
						lcb[ iActiveIndexListCB ].bLeftTriggerDownLastCheckGBD = true;
						return true;
					}
				}
				else
				{
					//trigger isn't down
					lcb[ iActiveIndexListCB ].bLeftTriggerDownLastCheckGBD = false;
				}
			}
			if (button == Button.RightTrigger) 
			{
				if( GetTrigger( Trigger.RightTrigger , controlIndex ) == 1 )
				{
					//trigger is down
					if( lcb[ iActiveIndexListCB ].bRightTriggerDownLastCheckGBD )
					{
						//button down last check, so it wasn't pressed this check
						return false;
					}
					else
					{
						lcb[ iActiveIndexListCB ].bRightTriggerDownLastCheckGBD = true;
						return true;
					}
				}
				else
				{
					//trigger isn't down
					lcb[ iActiveIndexListCB ].bRightTriggerDownLastCheckGBD = false;
				}
			}

            KeyCode code = GetKeycode(button, controlIndex);
            return Input.GetKeyDown(code);
        }

        public static bool GetButtonUp(Button button, Index controlIndex)
        {
			if (!bStructsSet) 
			{
				SetAllStructToZero ();
				bStructsSet = true;
			}
			GrabCorrectStruct (controlIndex);
			if (button == Button.LeftTrigger)
			{
				bool value = (GetTrigger (Trigger.LeftTrigger, controlIndex) > .2f);//find out if button is down
				if( value ) //if so, record it
				{
					lcb[ iActiveIndexListCB ].bLeftTriggerDownLastCheckGBU = true;
					return false;
				}
				else
				{
					if( lcb[ iActiveIndexListCB ].bLeftTriggerDownLastCheckGBU )
					{
						lcb[ iActiveIndexListCB ].bLeftTriggerDownLastCheckGBU = false;
						return true;
					}
				}
			}

			//now do the same thing with right
			if (button == Button.RightTrigger)
			{
				bool value = GetTrigger (Trigger.RightTrigger, controlIndex) == 1;//find out if button is down
				if( value ) //if so, record it
					lcb[ iActiveIndexListCB ].bRightTriggerDownLastCheckGBU = true;
				else
				{//if not
					if( lcb[ iActiveIndexListCB ].bRightTriggerDownLastCheckGBU )//check if button was down last check
					{//it was
						lcb[ iActiveIndexListCB ].bRightTriggerDownLastCheckGBU = false;//record that it is not down now
						return true; //return button is up
					}
					//cb.bRightTriggerDownLastCheckGBU = false; // ensure that it is recorded that button is not down
				}
			}
            KeyCode code = GetKeycode(button, controlIndex);
            return Input.GetKeyUp(code);
        }

        public static bool GetButton(Button button, Index controlIndex)
        {
			if (!bStructsSet) 
			{
				SetAllStructToZero ();
				bStructsSet = true;
			}
			GrabCorrectStruct (controlIndex);
			if( button == Button.LeftTrigger )
			{
				return GetTrigger(Trigger.LeftTrigger , controlIndex ) != 0;
			}
			if( button == Button.RightTrigger )
			{
				return GetTrigger(Trigger.RightTrigger , controlIndex ) != 0;
			}
            KeyCode code = GetKeycode(button, controlIndex);
            return Input.GetKey(code);
        }

        /// <summary>
        /// returns a specified axis
        /// </summary>
        /// <param name="axis">One of the analogue sticks, or the dpad</param>
        /// <param name="controlIndex">The controller number</param>
        /// <param name="raw">if raw is false then the controlIndex will be returned with a deadspot</param>
        /// <returns></returns>
		/// 
		/// 
        

		public static Vector2 GetAxis(Axis axis, Index controlIndex) 
		{
			return GetAxis(axis,controlIndex,false);

		}
		
		public static Vector2 GetAxis(Axis axis, Index controlIndex, bool raw)
        {


            string xName = "", yName = "";
            switch (axis)
            {
                case Axis.Dpad:
                    xName = "DPad_XAxis_" + (int)controlIndex;
                    yName = "DPad_YAxis_" + (int)controlIndex;
                    break;
                case Axis.LeftStick:
                    xName = "L_XAxis_" + (int)controlIndex;
                    yName = "L_YAxis_" + (int)controlIndex;
                    break;
                case Axis.RightStick:
                    xName = "R_XAxis_" + (int)controlIndex;
                    yName = "R_YAxis_" + (int)controlIndex;
                    break;
            }

            Vector2 axisXY = Vector3.zero;

            try
            {
                if (raw == false)
                {
                    axisXY.x = Input.GetAxis(xName);
                    axisXY.y = -Input.GetAxis(yName);
                }
                else
                {
                    axisXY.x = Input.GetAxisRaw(xName);
                    axisXY.y = -Input.GetAxisRaw(yName);
                }
            }
            catch (System.Exception e)
            {
                Debug.LogError(e);
                Debug.LogWarning("Have you set up all axes correctly? \nThe easiest solution is to replace the InputManager.asset with version located in the GamepadInput package. \nWarning: do so will overwrite any existing input");
            }
            return axisXY;
        }

		public static float GetTrigger(Trigger trigger, Index controlIndex)
		{
			return GetTrigger( trigger, controlIndex, false);
		}


        public static float GetTrigger(Trigger trigger, Index controlIndex, bool raw )
        {
            //
            string name = "";
            if (trigger == Trigger.LeftTrigger)
                name = "TriggersL_" + (int)controlIndex;
            else if (trigger == Trigger.RightTrigger)
                name = "TriggersR_" + (int)controlIndex;

            //
            float axis = 0;
            try
            {
                if (raw == false)
                    axis = Input.GetAxis(name);
                else
                    axis = Input.GetAxisRaw(name);
            }
            catch (System.Exception e)
            {
                Debug.LogError(e);
                Debug.LogWarning("Have you set up all axes correctly? \nThe easiest solution is to replace the InputManager.asset with version located in the GamepadInput package. \nWarning: do so will overwrite any existing input");
            }
            return axis;
        }


        static KeyCode GetKeycode(Button button, Index controlIndex)
        {
            switch (controlIndex)
            {
                case Index.One:
                    switch (button)
                    {
                        case Button.A: return KeyCode.Joystick1Button0;
                        case Button.B: return KeyCode.Joystick1Button1;
                        case Button.X: return KeyCode.Joystick1Button2;
                        case Button.Y: return KeyCode.Joystick1Button3;
                        case Button.RightShoulder: return KeyCode.Joystick1Button5;
                        case Button.LeftShoulder: return KeyCode.Joystick1Button4;
                        case Button.Back: return KeyCode.Joystick1Button6;
                        case Button.Start: return KeyCode.Joystick1Button7;
                        case Button.LeftStick: return KeyCode.Joystick1Button8;
                        case Button.RightStick: return KeyCode.Joystick1Button9;
                    }
                    break;
                case Index.Two:
                    switch (button)
                    {
                        case Button.A: return KeyCode.Joystick2Button0;
                        case Button.B: return KeyCode.Joystick2Button1;
                        case Button.X: return KeyCode.Joystick2Button2;
                        case Button.Y: return KeyCode.Joystick2Button3;
                        case Button.RightShoulder: return KeyCode.Joystick2Button5;
                        case Button.LeftShoulder: return KeyCode.Joystick2Button4;
                        case Button.Back: return KeyCode.Joystick2Button6;
                        case Button.Start: return KeyCode.Joystick2Button7;
                        case Button.LeftStick: return KeyCode.Joystick2Button8;
                        case Button.RightStick: return KeyCode.Joystick2Button9;
                    }
                    break;
                case Index.Three:
                    switch (button)
                    {
                        case Button.A: return KeyCode.Joystick3Button0;
                        case Button.B: return KeyCode.Joystick3Button1;
                        case Button.X: return KeyCode.Joystick3Button2;
                        case Button.Y: return KeyCode.Joystick3Button3;
                        case Button.RightShoulder: return KeyCode.Joystick3Button5;
                        case Button.LeftShoulder: return KeyCode.Joystick3Button4;
                        case Button.Back: return KeyCode.Joystick3Button6;
                        case Button.Start: return KeyCode.Joystick3Button7;
                        case Button.LeftStick: return KeyCode.Joystick3Button8;
                        case Button.RightStick: return KeyCode.Joystick3Button9;
                    }
                    break;
                case Index.Four:

                    switch (button)
                    {
                        case Button.A: return KeyCode.Joystick4Button0;
                        case Button.B: return KeyCode.Joystick4Button1;
                        case Button.X: return KeyCode.Joystick4Button2;
                        case Button.Y: return KeyCode.Joystick4Button3;
                        case Button.RightShoulder: return KeyCode.Joystick4Button5;
                        case Button.LeftShoulder: return KeyCode.Joystick4Button4;
                        case Button.Back: return KeyCode.Joystick4Button6;
                        case Button.Start: return KeyCode.Joystick4Button7;
                        case Button.LeftStick: return KeyCode.Joystick4Button8;
                        case Button.RightStick: return KeyCode.Joystick4Button9;
                    }

                    break;
                case Index.Any:
                    switch (button)
                    {
                        case Button.A: return KeyCode.JoystickButton0;
                        case Button.B: return KeyCode.JoystickButton1;
                        case Button.X: return KeyCode.JoystickButton2;
                        case Button.Y: return KeyCode.JoystickButton3;
                        case Button.RightShoulder: return KeyCode.JoystickButton5;
                        case Button.LeftShoulder: return KeyCode.JoystickButton4;
                        case Button.Back: return KeyCode.JoystickButton6;
                        case Button.Start: return KeyCode.JoystickButton7;
                        case Button.LeftStick: return KeyCode.JoystickButton8;
                        case Button.RightStick: return KeyCode.JoystickButton9;
                    }
                    break;
            }
            return KeyCode.None;
        }

		public static GamepadState GetState(Index controlIndex)
		{
			return GetState( controlIndex, false);
		}

        public static GamepadState GetState(Index controlIndex, bool raw )
        {
            GamepadState state = new GamepadState();

            state.A = GetButton(Button.A, controlIndex);
            state.B = GetButton(Button.B, controlIndex);
            state.Y = GetButton(Button.Y, controlIndex);
            state.X = GetButton(Button.X, controlIndex);

            state.RightShoulder = GetButton(Button.RightShoulder, controlIndex);
            state.LeftShoulder = GetButton(Button.LeftShoulder, controlIndex);
            state.RightStick = GetButton(Button.RightStick, controlIndex);
            state.LeftStick = GetButton(Button.LeftStick, controlIndex);

            state.Start = GetButton(Button.Start, controlIndex);
            state.Back = GetButton(Button.Back, controlIndex);

            state.LeftStickAxis = GetAxis(Axis.LeftStick, controlIndex, raw);
            state.rightStickAxis = GetAxis(Axis.RightStick, controlIndex, raw);
            state.dPadAxis = GetAxis(Axis.Dpad, controlIndex, raw);

            state.Left = (state.dPadAxis.x < 0);
            state.Right = (state.dPadAxis.x > 0);
            state.Up = (state.dPadAxis.y > 0);
            state.Down = (state.dPadAxis.y < 0);

            state.LeftTrigger = GetTrigger(Trigger.LeftTrigger, controlIndex, raw);
            state.RightTrigger = GetTrigger(Trigger.RightTrigger, controlIndex, raw);

            return state;
        }

		static void GrabCorrectStruct( GamePad.Index index )
		{
			//Debug.Log (index.ToString ());
			switch (index) 
			{
			case Index.One:
				iActiveIndexListCB = 0;
				break;
			case Index.Two:
				iActiveIndexListCB = 1;
				break;
			case Index.Three:
				iActiveIndexListCB = 2;
				break;
			case Index.Four:
				iActiveIndexListCB = 3;
				break;
			default :
				Debug.Log ("default called - GamePad.cs - GrabCorrectStruct");
				iActiveIndexListCB = 0;
				break;
			}

		}

		static void SetAllStructToZero()
		{
			lcb = new List<controllerBools> ();

			controllerBools c1 = new controllerBools ();
			c1.index = 1;
			c1.bLeftTriggerDownLastCheckGBD = false;
			c1.bLeftTriggerDownLastCheckGBU = false;
			c1.bRightTriggerDownLastCheckGBD = false;
			c1.bRightTriggerDownLastCheckGBU = false;
			lcb.Add (c1);

			controllerBools c2 = new controllerBools ();
			c2.index = 2;
			c2.bLeftTriggerDownLastCheckGBD = false;
			c2.bLeftTriggerDownLastCheckGBU = false;
			c2.bRightTriggerDownLastCheckGBD = false;
			c2.bRightTriggerDownLastCheckGBU = false;
			lcb.Add (c2);

			controllerBools c3 = new controllerBools ();
			c3.index = 3;
			c3.bLeftTriggerDownLastCheckGBD = false;
			c3.bLeftTriggerDownLastCheckGBU = false;
			c3.bRightTriggerDownLastCheckGBD = false;
			c3.bRightTriggerDownLastCheckGBU = false;
			lcb.Add (c3);

			controllerBools c4 = new controllerBools ();
			c4.index = 4;
			c4.bLeftTriggerDownLastCheckGBD = false;
			c4.bLeftTriggerDownLastCheckGBU = false;
			c4.bRightTriggerDownLastCheckGBD = false;
			c4.bRightTriggerDownLastCheckGBU = false;
			lcb.Add (c4);
		}

    }

    public class GamepadState
    {
        public bool A = false;
        public bool B = false;
        public bool X = false;
        public bool Y = false;
        public bool Start = false;
        public bool Back = false;
        public bool Left = false;
        public bool Right = false;
        public bool Up = false;
        public bool Down = false;
        public bool LeftStick = false;
        public bool RightStick = false;
        public bool RightShoulder = false;
        public bool LeftShoulder = false;

        public Vector2 LeftStickAxis = Vector2.zero;
        public Vector2 rightStickAxis = Vector2.zero;
        public Vector2 dPadAxis = Vector2.zero;

        public float LeftTrigger = 0;
        public float RightTrigger = 0;

    }

}


//time based getbuttondown; stored in case gettrigger method doesn't work as expected
//public static bool GetButtonDown(Button button, Index controlIndex)
//{
//	fTimeSinceLeftTriggerPress += Time.time - fTimeLastChecked; //since no update, make my own deltatime
//	fTimeSinceRightTriggerPress += Time.time - fTimeLastChecked;
//	fTimeLastChecked = Time.time;
//	
//	if( button == Button.LeftTrigger )
//	{
//		//bLeftTriggerWasDown = false;
//		if( GetTrigger(Trigger.LeftTrigger , controlIndex ) == 1 )//check trigger pressed
//		{//pressed true
//			if( fTimeSinceLeftTriggerPress > fTimeWaitBetweenTriggerPresses )//
//			{//
//				fTimeSinceLeftTriggerPress = 0;
//				return true;//return trigger is in fact pressed
//			}
//		}
//		return false;//return claiming trigger not pressed
//	}
//	if( button == Button.RightTrigger )
//	{
//		//bLeftTriggerWasDown = false;
//		if( GetTrigger(Trigger.RightTrigger , controlIndex ) == 1 )//check trigger pressed
//		{//pressed true
//			if( fTimeSinceRightTriggerPress > fTimeWaitBetweenTriggerPresses )//
//			{//
//				fTimeSinceRightTriggerPress = 0;
//				return true;//return trigger is in fact pressed
//			}
//		}
//		return false;//return claiming trigger not pressed
//	}
//	
//	KeyCode code = GetKeycode(button, controlIndex);
//	return Input.GetKeyDown(code);
//}