From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the akpm tree with the percpu tree
Date: Mon, 3 Jun 2013 23:59:17 -0700
Message-ID: <CAOS58YMLbcmnK_bEuhvLKzpHsVUNMYyPApKtLJ9vLJ=fOCJ2PA@mail.gmail.com>
References: <20130604154341.f7afbe1cf405ec6205d14dc8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:42250 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759581Ab3FDG7S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Jun 2013 02:59:18 -0400
In-Reply-To: <20130604154341.f7afbe1cf405ec6205d14dc8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Kent Overstreet <koverstreet@google.com>

Hello,

Sorry about that. Forgot that the series was already in -mm. Due to
the interface change, the old aio patches won't work on top of the new
percpu-ref patch. Kent is rebasing the rest but until then we need to
either drop the aio patches from -mm or keep using the old percpu-ref
patch. Given that other subsystems are scheduled to pull in the
percpu-ref patch and build on top and Kent is working to rebase the
series, we probably should drop the series from -mm. Andrew?

Thanks and sorry about the trouble.

--
tejun
