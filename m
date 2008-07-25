From: Roland Dreier <rdreier@cisco.com>
Subject: [ofa-general] Re: linux-next: manual merge of the infiniband tree
Date: Thu, 24 Jul 2008 20:50:05 -0700
Message-ID: <adaabg6wrki.fsf@cisco.com>
References: <20080725134444.9e67772c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <20080725134444.9e67772c.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Fri, 25 Jul 2008 13:44:44 +1000")
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

 > Today's linux-next merge of the infiniband tree got a conflict in
 > include/linux/mlx4/qp.h between commit
 > 95d04f0735b4fc837bff9aedcc3f3efb20ddc3d1 ("IB/mlx4: Add support for
 > memory management extensions and local DMA L_Key") from Linus' tree and
 > commit 5fcbaab14db959eb6feecae57387cfff364f11b3 ("IB/mlx4: Add support
 > for memory management extensions and local DMA L_Key") from the
 > infiniband tree.
 > 
 > Please don't submit patches to Linus that are different to those you have
 > in linux-next.

Sorry, someone pointed out a bug in the patch just before I sent it to
Linus.  I've updated my tree to Linus's, so this conflict should be gone
tomorrow.

Thanks,
  Roland
