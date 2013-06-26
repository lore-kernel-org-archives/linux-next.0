From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the arm-mpidr tree with the arm
	tree
Date: Wed, 26 Jun 2013 09:09:36 +0100
Message-ID: <20130626080936.GD7193@flint.arm.linux.org.uk>
References: <20130626110411.d1fe3913769385fa056010be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:46512 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751810Ab3FZIJ7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2013 04:09:59 -0400
Content-Disposition: inline
In-Reply-To: <20130626110411.d1fe3913769385fa056010be@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 26, 2013 at 11:04:11AM +1000, Stephen Rothwell wrote:
> Hi Lorenzo,
> 
> Today's linux-next merge of the arm-mpidr tree got a conflict in
> arch/arm/kernel/suspend.c between commit 7604537bbb57 ("ARM: kernel:
> implement stack pointer save array through MPIDR hashing") from the arm
> tree and commit 3fed6a1e3bf0 ("ARM: kernel: implement stack pointer save
> array through MPIDR hashing") from the arm-mpidr tree.
> 
> The former is just a rebase of the latter, so I used it.  It then turns
> out that the arm-mpidr contains nothing that is not already included in
> the arm tree, so is it needed any more i.e. is there further work coming?

The reason for this is that the changes were submitted to me as patches
as two of the changes are for -rc, the other one is a development change,
but in Lorenzo's git tree, they're all part of a single branch, and so
can't be separately pushed upstream.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
