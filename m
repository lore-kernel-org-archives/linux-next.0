From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 23
Date: Thu, 23 Oct 2008 18:04:12 -0700
Message-ID: <20081023180412.394d40c2.randy.dunlap@oracle.com>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757182AbYJXBFF@vger.kernel.org>
In-Reply-To: <20081023213637.eff9b414.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, ericvh@gmail.com, rolandd@cisco.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, v9fs-developer@lists.sourceforge.net, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

On Thu, 23 Oct 2008 21:36:37 +1100 Stephen Rothwell wrote:

> Hi all,

Building with CONFIG_INFINIBAND=m, kconfig allows CONFIG_NET_9P_RDMA=m,
so one module wants symbols from the other (net/9p wants symbols from rmda_*).

ERROR: "rdma_destroy_id" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_connect" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_create_id" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_create_qp" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_resolve_route" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_disconnect" [net/9p/9pnet_rdma.ko] undefined!
ERROR: "rdma_resolve_addr" [net/9p/9pnet_rdma.ko] undefined!

Is this supposed to be allowed/possible?  Otherwise NET_9P_RDMA might
have to depend on INFINBAND=y...

---
~Randy
