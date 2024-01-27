# Usability Evaluation
Document your usability evaluation (plan and findings).

## Usability Heuristics

The app was checked using Jakob Nielsen's 10 general principles for interaction design in full before the final presentation, showing mostly positive results. Because we focused on developing an app for smartphones the evaluation was performed on a mobile device.
Many positive results stem from the comparatively few inputs a user can perform in the app.
An evaluation using the web version may very well yield different results.

Some of the heuristics were also checked beforehand, during the UI refactoring, mainly 'Consistency and Standards', 'User Controll and Freedom' and 'Visibility of system status'.
 
| Heuristik | Fullfiled? |Why/ Why not? | What should be improved? |
|-----------|----------|-------------|------------------------------------|
| Visibility of system status | [x] yes [ ] no | Menu and Event screens show loading animation | |
| Match between system and the real world | [x] yes [ ] no | The word 'menu' might lead to confusion for german users despite the menu icon.| Should be observed while testing with users |
| User control and freedom | [x] yes [ ] no | All screens have buttons, that lead back to the previous screen. Unintentional selection of favorites can be corrected with one tap. | A visual cue wheather 'I'm coming' was selected would improve the users ability to deteemin if the action is already executed |
| Consistency and standards | [x] yes [ ] no | The app uses the same visual elements like expandable lists or card consistantly throughought the app, e.g. the event cards in the event calander and favorite screens are the same. | One could argue that the Icons in the AppBar have the same design as the favorite icons for events and menu items and therefore suggest similar funktionality -> Should be observed in further user testing. |
| Error prevention | [x] yes [ ] no | Apart from sending Feedback, that needs to be confirmed by tapping a button, the user can't perform any action that could be considered a crucial error. Unintentional taps can be undone with one more tap. | |
| Recognition rather than recall | [x] yes [ ] no | The app doesn't require the user to remember information from one screen to perform an action on another screen. | |
| Flexibility and efficiency of use | [x] yes [ ] no | Selection of favorites and swiping between screen offer a faster way to navigate through the app for regular users. Exporting an event to the personal calendar removes the need to access this app for specific information | |
| Aesthetic and minimalist design | [x] yes [ ] no | It should be tested whether the home screen is neccessary or becomes irrelevant to users over time | |
| Help users recognize, diagnose, and recover from errors | [ ] yes [x] no | The app does not show any error messages. | The app should be checked for errors and appropriate error messages should be implemented. |
| Help and documentation | [ ] yes [x] no | The app does not contain any information on how to use it, because no complicated actions need to be performed to use it. It also lacks semantic labels for accessibility. | Whether documentation on how to use the app needs to be provided should be checked during user testing. Accessibility features need to be implemented in any case. |

# Walkthrough

A walthrough video of our app can be found under the following link:
https://drive.google.com/file/d/1J0i0wDzN7ti7-FVd8jPfCwIdqr2waZip/view?usp=sharing
