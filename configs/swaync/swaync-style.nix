{ pkgs, ...} : {
  services.swaync.style = ''
  * {
  all: unset;
  font-size: 14px;
  font-family: "Ubuntu Nerd Font";
  transition: 200ms;
}

trough highlight {
  background: #c6d0f5;
}
/* Target the main notification image/icon */
.notification-row .notification-background .image {
    -gtk-icon-size: 40px; /* Adjust this value as needed */
    margin: 10px;         /* Optional: add spacing around the icon */
}

/* If you want to target the app-icon specifically (the smaller one) */
.notification-row .notification-background .app-icon {
    -gtk-icon-size: 40px;
}

scale trough {
  margin: 0rem 1rem;
  background-color: #414559;
  min-height: 8px;
  min-width: 70px;
}

slider {
  background-color: #8caaee;
}

.floating-notifications.background .notification-row .notification-background {
  box-shadow: inset 0 0 0 1px #414559; 
  margin: 2px 10px; /* Reduced vertical margin to prevent the 'ghost' box */
  background: rgba(30, 30, 46, 0.7); /* Slightly more transparent for better blur */
  border-radius: 12.6px;
  color: #c6d0f5;
  padding: 0;
}

.floating-notifications.background .notification-row .notification-background .notification {
  padding: 7px;
  border-radius: 12.6px;
}

.floating-notifications.background .notification-row .notification-background .notification.critical {
  box-shadow: inset 0 0 7px 0 #e78284;
}

.floating-notifications.background .notification-row .notification-background .notification .notification-content {
  margin: 7px;
}

.floating-notifications.background .notification-row .notification-background .notification .notification-content .summary {
  color: #c6d0f5;
  font-weight: bold;
}

.floating-notifications.background .notification-row .notification-background .notification .notification-content .time {
  color: #a5adce;
}

.floating-notifications.background .notification-row .notification-background .notification .notification-content .body {
  color: #c6d0f5;
}

.floating-notifications.background .notification-row .notification-background .notification > *:last-child > * {
  min-height: 3.4em;
}

.floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action {
  border-radius: 7px;
  color: #c6d0f5;
  background-color: #414559;
  box-shadow: inset 0 0 0 1px #51576d;
  margin: 7px;
}

.floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
  box-shadow: inset 0 0 0 1px #51576d;
  background-color: #414559;
  color: #c6d0f5;
}

.floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
  box-shadow: inset 0 0 0 1px #51576d;
  background-color: #85c1dc;
  color: #c6d0f5;
}

.floating-notifications.background .notification-row .notification-background .close-button {
  margin: 7px;
  padding: 2px;
  border-radius: 6.3px;
  color: #303446;
  background-color: #e78284;
}

.floating-notifications.background .notification-row .notification-background .close-button:hover {
  background-color: #ea999c;
  color: #303446;
}

.floating-notifications.background .notification-row .notification-background .close-button:active {
  background-color: #e78284;
  color: #303446;
}

.control-center {
  box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.8), inset 0 0 0 1px #414559;
  border-radius: 12.6px;
  margin: 4px;
  background: rgba(30, 30, 46, 0.6);
  color: #c6d0f5;
  padding: 14px;
}

.control-center .widget-title > label {
  color: #c6d0f5;
  font-size: 1.3em;
}

.control-center .widget-title button {
  border-radius: 7px;
  color: #c6d0f5;
  background-color: #414559;
  box-shadow: inset 0 0 0 1px #51576d;
  padding: 8px;
}

.control-center .widget-title button:hover {
  box-shadow: inset 0 0 0 1px #51576d;
  background-color: #626880;
  color: #c6d0f5;
}

.control-center .widget-title button:active {
  box-shadow: inset 0 0 0 1px #51576d;
  background-color: #85c1dc;
  color: #303446;
}

.control-center .notification-row .notification-background {
  border-radius: 7px;
  color: #c6d0f5;
  background-color: #414559;
  box-shadow: inset 0 0 0 1px #51576d;
  margin-top: 10px;
}

.control-center .notification-row .notification-background .notification {
  padding: 7px;
  border-radius: 7px;
}

.control-center .notification-row .notification-background .notification.critical {
  box-shadow: inset 0 0 7px 0 #e78284;
}

.control-center .notification-row .notification-background .notification .notification-content {
  margin: 7px;
}

.control-center .notification-row .notification-background .notification .notification-content .summary {
  color: #c6d0f5;
  font-weight: 900;
}

.control-center .notification-row .notification-background .notification .notification-content .time {
  color: #a5adce;
}

.control-center .notification-row .notification-background .notification .notification-content .body {
  color: #c6d0f5;
}

.control-center .notification-row .notification-background .notification > *:last-child > * {
  min-height: 3.4em;
}

.control-center .notification-row .notification-background .notification > *:last-child > * .notification-action {
  border-radius: 7px;
  color: #c6d0f5;
  background-color: #232634;
  box-shadow: inset 0 0 0 1px #51576d;
  margin: 7px;
}

.control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
  box-shadow: inset 0 0 0 1px #51576d;
  background-color: #414559;
  color: #c6d0f5;
}

.control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
  box-shadow: inset 0 0 0 1px #51576d;
  background-color: #85c1dc;
  color: #c6d0f5;
}

.control-center .notification-row .notification-background .close-button {
  margin: 7px;
  padding: 2px;
  border-radius: 6.3px;
  color: #303446;
  background-color: #ea999c;
}

.close-button {
  border-radius: 6.3px;
}

.control-center .notification-row .notification-background .close-button:hover {
  background-color: #e78284;
  color: #303446;
}

.control-center .notification-row .notification-background .close-button:active {
  background-color: #e78284;
  color: #303446;
}

.control-center .notification-row .notification-background:hover {
  box-shadow: inset 0 0 0 1px #51576d;
  background-color: #51576d;
  color: #c6d0f5;
}

.control-center .notification-row .notification-background:active {
  box-shadow: inset 0 0 0 1px #51576d;
  background-color: #51576d;
  color: #c6d0f5;
}

.notification.critical progress {
  background-color: #e78284;
}

.notification.low progress,
.notification.normal progress {
  background-color: #8caaee;
}

.control-center-dnd {
  margin-top: 5px;
  border-radius: 8px;
  background: #414559;
  border: 1px solid #51576d;
  box-shadow: none;
}

.control-center-dnd:checked {
  background: #414559;
}

.control-center-dnd slider {
  background: #51576d;
  border-radius: 8px;
}

.widget-dnd {
  margin: 0px;
  font-size: 1.1rem;
  font-weight: 500;
}

.widget-dnd > switch {
  font-size: initial;
  border-radius: 8px;
  background: #414559;
  border: 1px solid #51576d;
  box-shadow: none;
}

.widget-dnd > switch:checked {
  background: #414559;
}

.widget-dnd > switch slider {
  background: #51576d;
  border-radius: 8px;
  border: 1px solid #737994;
}

/* --- MPRIS Widget Conversion --- */

.widget-mpris .widget-mpris-player {
  margin: 5px;
  min-height: 100px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
  background-color: rgba(65, 69, 89, 0.6);
}

.widget-mpris .widget-mpris-player .mpris-background {
  filter: blur(10px) brightness(0.4);
}

.widget-mpris .widget-mpris-player .widget-mpris-album-art {
  -gtk-icon-size: 80px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
  min-width: 80px;
  min-height: 80px;
  background-size: cover;
  margin-left: 10px;
  margin-top: 10px;
}

.widget-mpris .widget-mpris-player .widget-mpris-title {
  font-size: 1.2rem;
  font-weight: bold;
  margin-right: 10px;
}

.widget-mpris .widget-mpris-player .widget-mpris-subtitle {
  font-size: 0.8rem;
  margin-right: 10px;
}

/* Button styling using Dracula Background (#282a36) */
.widget-mpris .widget-mpris-player button {
  background-color: rgba(40, 42, 54, 0.5);
  padding: 5px;
  border-radius: 7px;
  margin-bottom: 5px;
}

.widget-mpris .widget-mpris-player button:hover {
  background-color: rgba(40, 42, 54, 0.8);
}

.widget-menubar > box > .menu-button-bar > button > label {
  font-size: 3rem;
  padding: 0.5rem 2rem;
}

.widget-menubar > box > .menu-button-bar > :last-child {
  color: #e78284;
}

.power-buttons button:hover,
.powermode-buttons button:hover,
.screenshot-buttons button:hover {
  background: #414559;
}

.control-center .widget-label > label {
  color: #c6d0f5;
  font-size: 1rem;
}

.widget-buttons-grid {
  padding-top: 1rem;
  margin-bottom: 1rem;
}

.widget-buttons-grid > flowbox {
  row-spacing: 0.5rem;     /* vertical gap between rows */
  column-spacing: 1rem;    /* horizontal gap between icons */
}

.widget-buttons-grid > flowbox > flowboxchild > button {
  margin: 0.25rem;
  border: 1px solid #51576d;  
  border-radius: 6px;
}

.widget-buttons-grid > flowbox > flowboxchild > button label {
  font-size: 1.5rem;
}

.widget-volume {
  padding-top: 1rem;
  margin-bottom: 2rem; 
}

.widget-volume label {
  font-size: 1.5rem;
  color: #85c1dc;
  margin: 10px
}

.widget-volume trough highlight {
  background: #85c1dc;
}

.widget-backlight trough highlight {
  background: #e5c890;
}

.widget-backlight label {
  font-size: 1.5rem;
  color: #e5c890;
}

.widget-backlight .KB {
  padding-bottom: 1rem;
}

.image {
  padding-right: 0.5rem;
}

  '';
}
