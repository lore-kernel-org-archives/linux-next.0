From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: manual merge of the slab tree
Date: Wed, 13 Aug 2008 09:19:27 +0300
Message-ID: <48A27CEF.3040708@cs.helsinki.fi>
References: <20080813145741.43da1fc8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:41622 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750796AbYHMGW7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Aug 2008 02:22:59 -0400
In-Reply-To: <20080813145741.43da1fc8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>

Hi Stephen,

Stephen Rothwell wrote:
> Today's linux-next merge of the slab tree got a conflict in
> lib/Kconfig.debug between commit 3794f3e812ef707a4f7931742274d1d0ca6597b4
> ("docsrc: build Documentation/ sources") from Linus' tree and commit
> 5db80305ad7ea891246aec24204630c2925e7b12 ("kmemtrace: Core
> implementation") from the slab tree.
> 
> Just a matter of overlapping additions.  I took both sets.

Can I fix this up in my tree? Mine is based on Linus so should I rebase 
my 'for-next' branch on top of linux-next?
