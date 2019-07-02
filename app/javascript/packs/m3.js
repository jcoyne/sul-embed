import '@babel/polyfill';
import 'url-polyfill/url-polyfill';
import 'unfetch/polyfill';
import smoothscroll from 'smoothscroll-polyfill';
import { CssInjection } from '../../assets/javascripts/modules/css_injection.js';
import { CommonViewerBehavior } from '../../assets/javascripts/modules/common_viewer_behavior.js';
import M3Viewer from '../../assets/javascripts/modules/m3_viewer.js';

smoothscroll.polyfill();
CssInjection.appendToHead();
CommonViewerBehavior.initializeViewer(M3Viewer.init);
