From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Date: Tue, 22 Feb 2011 14:34:34 +0000
Message-ID: <20110222143434.GA9720@srcf.ucam.org>
References: <20110222162206.c3fb0636.sfr@canb.auug.org.au> <a8c6f32c-ccb5-4f65-b537-8bd1c11f7336@email.android.com> <20110222114601.GA936@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60565 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753266Ab1BVOen (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Feb 2011 09:34:43 -0500
Content-Disposition: inline
In-Reply-To: <20110222114601.GA936@kamineko.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86 <platform-driver-x86@vger.kernel.org>

On Tue, Feb 22, 2011 at 08:46:01PM +0900, Mattia Dongili wrote:

> how does linux-next work? should this patch be a separate commit or can
> it be folded into the offending one?

I'll fold it into the offending one and repush. Sorry about the 
breakage, Stephen - I don't have DEBUG_ALLOC enabled so didn't see the 
failure. Do you build with a defined configuration I can test against?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
