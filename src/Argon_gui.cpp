#include "Argon_gui.h"

Argon_GUI::Argon_GUI(const wxString& title)
       : wxFrame(NULL, wxID_ANY, title, wxDefaultPosition, wxSize(800, 600))
{
	SetIcon(wxIcon(wxT("/Users/max/projects/argon/icons/argon.png"), wxBITMAP_TYPE_PNG));
	Centre();
}