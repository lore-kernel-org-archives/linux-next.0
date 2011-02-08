From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: build failure after merge of the slab tree
Date: Tue, 8 Feb 2011 11:44:45 -0600 (CST)
Message-ID: <alpine.DEB.2.00.1102081144170.15931@router.home>
References: <20110131144246.dfa2abe3.sfr@canb.auug.org.au> <1296502339.30654.13.camel@jaguar> <alpine.DEB.2.00.1102030919380.6519@router.home> <alpine.DEB.2.00.1102080952490.13202@router.home> <alpine.DEB.2.00.1102080954330.13649@router.home>
 <AANLkTi=Hykzpb+oK7HOXJCCNwpgRRbsJNuXz-2Uc9WbB@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp105.prem.mail.ac4.yahoo.com ([76.13.13.44]:23749 "HELO
	smtp105.prem.mail.ac4.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1755229Ab1BHRot (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Feb 2011 12:44:49 -0500
In-Reply-To: <AANLkTi=Hykzpb+oK7HOXJCCNwpgRRbsJNuXz-2Uc9WbB@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@googlemail.com>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Tso <tytso@mit.edu>, sandeen@redhat.com

On Tue, 8 Feb 2011, Sedat Dilek wrote:

> Isn't the fs/ext4 part obsolete by Eric's "ext4: make grpinfo slab
> cache names static"?
> The mentionned patch is pending in ext4.git#{master, for_linus} [1].
>
> Shouldn't this patch reduced to the mm/slab part?

If Eric fixed it with string constants then we do not need the slab part
either.
