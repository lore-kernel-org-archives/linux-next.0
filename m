From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: linux-next: manual merge of the arm-mpidr tree with the arm tree
Date: Wed, 26 Jun 2013 09:57:20 +0100
Message-ID: <20130626085719.GA22333@e102568-lin.cambridge.arm.com>
References: <20130626110411.d1fe3913769385fa056010be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:39859 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751506Ab3FZI50 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2013 04:57:26 -0400
In-Reply-To: <20130626110411.d1fe3913769385fa056010be@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <rmk@arm.linux.org.uk>

Hi Stephen,

On Wed, Jun 26, 2013 at 02:04:11AM +0100, Stephen Rothwell wrote:
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

No, arm-mpidr can be dropped from -next now that those patches, as you
correctly mentioned, are queued through the arm tree.

Thank you very much indeed,
Lorenzo
