#ifndef __OP_Node_h__
#define __OP_Node_h__

#include "OP/OP_Parameters.h"

// Blank class definitions for all our node types...
class OBJ_Node;
class SOP_Node;
class COP2_Node;
class COPNET_Node;
class ROP_Node;

class OP_Node: public OP_Parameters//, public OP_NetworkBoxItem
{
public:
	OP_Node();
	~OP_Node();

private:

};

#endif