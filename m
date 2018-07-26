From: Bart Van Assche <Bart.VanAssche@wdc.com>
Subject: Re: linux-next: build warning after merge of the rdma tree
Date: Thu, 26 Jul 2018 05:10:13 +0000
Message-ID: <36211fbe8a548742cf8e41a57f02f81e55c86794.camel@wdc.com>
References: <20180726105553.00a36e3c@canb.auug.org.au>
         <20180726030503.GA18170@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726030503.GA18170@mellanox.com>
Content-Language: en-US
Content-ID: <AB393101603C584796E2B0D6733DCE00@namprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "jgg@mellanox.com" <jgg@mellanox.com>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "dledford@redhat.com" <dledford@redhat.com>, "chuck.lever@oracle.com" <chuck.lever@oracle.com>
List-Id: linux-next.vger.kernel.org

On Wed, 2018-07-25 at 21:05 -0600, Jason Gunthorpe wrote:
+AD4- On Thu, Jul 26, 2018 at 10:55:53AM +-1000, Stephen Rothwell wrote:
+AD4- +AD4- Hi all,
+AD4- +AD4-=20
+AD4- +AD4- After merging the rdma tree, today's linux-next build (powerpc
+AD4- +AD4- ppc64+AF8-defconfig) produced this warning:
+AD4- +AD4-=20
+AD4- +AD4- net/sunrpc/xprtrdma/svc+AF8-rdma+AF8-rw.c: In function 'svc+AF8=
-rdma+AF8-post+AF8-chunk+AF8-ctxt':
+AD4- +AD4- net/sunrpc/xprtrdma/svc+AF8-rdma+AF8-rw.c:350:5: warning: 'bad+=
AF8-wr' may be used uninitialized in this function +AFs--Wmaybe-uninitializ=
ed+AF0-
+AD4- +AD4-   if (bad+AF8-wr +ACEAPQ- first+AF8-wr)
+AD4- +AD4-      +AF4-
+AD4-=20
+AD4- Huh. I'm quite surprised 0-day build service didn't warn on this.
+AD4-=20
+AD4- +AD4- Introduced by commit
+AD4- +AD4-=20
+AD4- +AD4-   ed288d74a9e5 (+ACI-net/xprtrdma: Simplify ib+AF8-post+AF8-(se=
nd+AHw-recv+AHw-srq+AF8-recv)() calls+ACI-)
+AD4- +AD4-=20
+AD4- +AD4- This is an actual problem.
+AD4-=20
+AD4- Yes, for sure. Bart?

Thanks Stephen for having reported this. I propose to revert the changes in
net/sunrpc/xprtrdma/svc+AF8-rdma+AF8-rw.c. Jason, do you want me to submit =
the below
as a formal patch?

Thanks,

Bart.


diff --git a/net/sunrpc/xprtrdma/svc+AF8-rdma+AF8-rw.c b/net/sunrpc/xprtrdm=
a/svc+AF8-rdma+AF8-rw.c
index 80975427f523..ce3ea8419704 100644
--- a/net/sunrpc/xprtrdma/svc+AF8-rdma+AF8-rw.c
+-+-+- b/net/sunrpc/xprtrdma/svc+AF8-rdma+AF8-rw.c
+AEAAQA- -329,7 +-329,7 +AEAAQA- static int svc+AF8-rdma+AF8-post+AF8-chunk=
+AF8-ctxt(struct svc+AF8-rdma+AF8-chunk+AF8-ctxt +ACo-cc)
 	do +AHs-
 		if (atomic+AF8-sub+AF8-return(cc-+AD4-cc+AF8-sqecount,
 				      +ACY-rdma-+AD4-sc+AF8-sq+AF8-avail) +AD4- 0) +AHs-
-			ret +AD0- ib+AF8-post+AF8-send(rdma-+AD4-sc+AF8-qp, first+AF8-wr, NULL)=
+ADs-
+-			ret +AD0- ib+AF8-post+AF8-send(rdma-+AD4-sc+AF8-qp, first+AF8-wr, +ACY=
-bad+AF8-wr)+ADs-
 			trace+AF8-svcrdma+AF8-post+AF8-rw(+ACY-cc-+AD4-cc+AF8-cqe,
 					      cc-+AD4-cc+AF8-sqecount, ret)+ADs-
 			if (ret)=
