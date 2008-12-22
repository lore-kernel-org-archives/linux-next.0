From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Mon, 22 Dec 2008 18:28:32 +1030
Message-ID: <200812221828.33016.rusty@rustcorp.com.au>
References: <20081222173213.b7340f63.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:54935 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752768AbYLVH6q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 02:58:46 -0500
In-Reply-To: <20081222173213.b7340f63.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>, Mark McLoughlin <markmc@redhat.com>

On Monday 22 December 2008 17:02:13 Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the rr tree got a conflict in
> drivers/virtio/virtio_pci.c between commit
> b5146336e3bc3786712919e94106063036dae86b ("virtio: do not statically
> allocate root device") from the driver-core tree and commits
> f53dba3a1ea82dfb37f094a942ae74032413809f ("virtio: struct device -
> replace bus_id with dev_name(), dev_set_name()") and
> ab4e479d47ceac2fa5bebd5b99d27f01fe0e0c8b ("virtio: add PCI device release
> () function") from the rr tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.  Mark, does
> this driver-core patch obsolete the second rr tree patch above?

This is not unexpected.  Mark sent me those two, the others went to
Greg.  I'm happy to ack them and send them on to Greg.

Thanks,
Rusty.
