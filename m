From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Date: Thu, 15 Dec 2016 11:47:50 +1100
Message-ID: <20161215114750.6915c7a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yonatan Cohen <yonatanc@mellanox.com>, Andrew Boyer <andrew.boyer@dell.com>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/sw/rxe/rxe_req.c

between commit:

  002e062e13db ("IB/rxe: Fix handling of erroneous WR")

from Linus' tree and commit:

  37f69f43fb5a ("IB/rxe: Hold refs when running tasklets")

from the rdma tree.

I fixed it up (I think - see below - thanks for the heads up, Doug) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/sw/rxe/rxe_req.c
index 22bd9630dcd9,b246653cf713..000000000000
--- a/drivers/infiniband/sw/rxe/rxe_req.c
+++ b/drivers/infiniband/sw/rxe/rxe_req.c
@@@ -696,8 -698,7 +698,9 @@@ next_wqe
  						       qp->req.wqe_index);
  			wqe->state = wqe_state_done;
  			wqe->status = IB_WC_SUCCESS;
 -			goto complete;
 +			__rxe_do_task(&qp->comp.task);
++			rxe_drop_ref(qp);
 +			return 0;
  		}
  		payload = mtu;
  	}
@@@ -746,18 -747,15 +749,20 @@@ err
  	wqe->status = IB_WC_LOC_PROT_ERR;
  	wqe->state = wqe_state_error;
  
 -complete:
 -	if (qp_type(qp) != IB_QPT_RC) {
 -		while (rxe_completer(qp) == 0)
 -			;
 -	}
 +	/*
 +	 * IBA Spec. Section 10.7.3.1 SIGNALED COMPLETIONS
 +	 * ---------8<---------8<-------------
 +	 * ...Note that if a completion error occurs, a Work Completion
 +	 * will always be generated, even if the signaling
 +	 * indicator requests an Unsignaled Completion.
 +	 * ---------8<---------8<-------------
 +	 */
 +	wqe->wr.send_flags |= IB_SEND_SIGNALED;
 +	__rxe_do_task(&qp->comp.task);
+ 	rxe_drop_ref(qp);
 -	return 0;
 +	return -EAGAIN;
  
  exit:
+ 	rxe_drop_ref(qp);
  	return -EAGAIN;
  }
