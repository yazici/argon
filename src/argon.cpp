#include "argon.h"
#include "Argon_gui.h"

IMPLEMENT_APP(ArgonApp)

bool ArgonApp::OnInit()
{
	wxImage::AddHandler(new wxPNGHandler);

    Argon_GUI *argon = new Argon_GUI(wxT("Argon"));
    argon->Show(true);

    return true;
}