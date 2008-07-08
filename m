From: Tobias Diedrich <ranma@tdiedrich.de>
Subject: Re: linux-next: manual merge of the net tree
Date: Tue, 8 Jul 2008 08:03:58 +0200
Message-ID: <20080708060358.GA6610@yamamaya.is-a-geek.org>
References: <20080708142759.18b9314a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yumi.tdiedrich.de ([85.10.210.183]:44005 "EHLO mx.tdiedrich.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751340AbYGHGEc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 02:04:32 -0400
Content-Disposition: inline
In-Reply-To: <20080708142759.18b9314a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Jesse Barnes <jbarnes@virtuousgeek.org>, Jeff Garzik <jgarzik@redhat.com>

Stephen Rothwell wrote:
> Today's linux-next merge of the net tree got a conflict in
> drivers/pci/pci-acpi.c between commit
> eb9d0fe40e313c0a74115ef456a2e43a6c8da72f ("PCI ACPI: Rework PCI handling
> of wake-up") from the pci tree and commit
> f5ccbcfacaae57e3312e623432a79d5f1f079cf5 ("Fix forcedeth
> hibernate/wake-on-lan problems") from the net tree.
> 
> The former removed the hook that the latter is trying to use.  I have
> used the pci version of this file for now.  There needs to be a better
> solution and since this net commit only updates pci code, maybe the
> solution lies there.

Assuming it's part of Rafaels "PCI wake-up" patchset, then using
that one should be right I think. :)

-- 
Tobias						PGP: http://9ac7e0bc.uguu.de
このメールは十割再利用されたビットで作られています。
