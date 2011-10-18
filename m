From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: import of rr series failed
Date: Wed, 19 Oct 2011 10:21:48 +1030
Message-ID: <87botdc0yz.fsf@rustcorp.com.au>
References: <20111014103638.accaae53bac0e74da3c787bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42233 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753087Ab1JSDFR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Oct 2011 23:05:17 -0400
In-Reply-To: <20111014103638.accaae53bac0e74da3c787bd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Fri, 14 Oct 2011 10:36:38 +1100, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
Non-text part: multipart/signed
> Hi Rusty,
> 
> Importing the rr series today I got this error:
> 
> $ git am ../quilt/rr/virtio:dont_add_config_to_list_for_per_vq_vector.patch
> Patch format detection failed.
> 
> I added a From line to the top using the address from the first SOB line.

Weird, don't know how that slipped through my checking script :(

Fixed up now, thanks.

Rusty.
