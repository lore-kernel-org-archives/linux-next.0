From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: possible removal of the kvm-ppc tree
Date: Tue, 6 Dec 2016 10:00:32 +1100
Message-ID: <20161206100032.02f823c9@canb.auug.org.au>
References: <20161205103911.5b3e6a40@canb.auug.org.au>
        <4DD53EA4-2C6D-4FBD-8787-F50223E61BCC@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48003 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751590AbcLEXAf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Dec 2016 18:00:35 -0500
In-Reply-To: <4DD53EA4-2C6D-4FBD-8787-F50223E61BCC@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Graf <agraf@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>

Hi Alex,

On Mon, 5 Dec 2016 07:52:00 +0200 Alexander Graf <agraf@suse.de> wrote:
>
> > Am 05.12.2016 um 01:39 schrieb Stephen Rothwell <sfr@canb.auug.org.au>:
> > 
> > I noticed that the kvm-ppc tree
> > (git://github.com/agraf/linux-2.6.git#kvm-ppc-next) has not been
> > updated for over a year.  I was wondering if I should remove it from
> > linux-next?
> > 
> > If so, I will rename the kvm-ppc-paulus tree to be the kvm-ppc tree.  
> 
> Yes, please go ahead.

Thanks, done.

-- 
Cheers,
Stephen Rothwell
