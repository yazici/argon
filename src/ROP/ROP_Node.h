#ifndef __ROP_Node__
#define __ROP_Node__

#include "OP/OP_Network.h"

extern "C" {
	SYS_VISIBILITY_EXPORT extern void   newDriverOperator(OP_OperatorTable *table);
};

enum  ROP_RENDER_CODE
{
	ROP_ABORT_RENDER = 0,       // Stop rendering
	ROP_CONTINUE_RENDER = 1,    // Go on to the next frame
	ROP_RETRY_RENDER = 2        // Retry this frame (primarily for network)
};
 
enum ROP_RenderMode
{
	ROP_RM_RENDER_CONTROLS,
	ROP_RM_RENDER,
	ROP_RM_PREVIEW,
	ROP_RM_BG_RENDER
};

enum
{
	ROP_NODE_RENDER,
	ROP_NODE_PREVIEW,
	ROP_NODE_RENDER_CTRL,
	ROP_NODE_TRANGE,
	ROP_NODE_FRANGE,
	ROP_NODE_TAKE,
	ROP_NODE_MAXPARMS
};

class ROP_Node//: public OP_Network
public:
	ROP_Node();
	~ROP_Node();

private:

};

#endif