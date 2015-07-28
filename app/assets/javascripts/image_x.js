//= require modules/css_injection
//= require vendor/tooltip
//= require modules/common_viewer_behavior
//= require modules/popup_panels
//= require modules/embed_this
//= require modules/image_x_viewer

CssInjection.injectFontAwesome();
CssInjection.appendToHead();
CommonViewerBehavior.initializeViewer(ImageXViewer.init);
PopupPanels.init();
EmbedThis.init();