From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: linux-next: build warnings after merge of the staging tree
Date: Wed, 6 May 2015 08:56:19 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1505060855420.2652@hadrien>
References: <20150506141050.5689c298@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:2938 "EHLO
	mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750730AbbEFG4f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2015 02:56:35 -0400
In-Reply-To: <20150506141050.5689c298@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org



On Wed, 6 May 2015, Stephen Rothwell wrote:

> Hi Greg,
>
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
>
> drivers/staging/lustre/lustre/llite/file.c: In function 'll_iocontrol_unregister':
> drivers/staging/lustre/lustre/llite/file.c:3249:17: warning: unused variable 'size' [-Wunused-variable]
>     unsigned int size = tmp->iocd_size;
>                  ^
> drivers/staging/lustre/lustre/llite/llite_lib.c: In function 'll_fill_super':
> drivers/staging/lustre/lustre/llite/llite_lib.c:912:12: warning: unused variable 'instlen' [-Wunused-variable]
>   const int instlen = sizeof(cfg->cfg_instance) * 2 + 2;
>             ^
>
> Introduced by commit 97903a26fcfc ("staging: lustre: llite: drop uses
> of OBD free functions").

Sorry for not having noticed.  I will take care of it as soon as possible.

julia
