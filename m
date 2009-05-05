From: "Jan Beulich" <jbeulich@novell.com>
Subject: Re: linux-next: kbuild tree build failure
Date: Tue, 05 May 2009 08:04:36 +0100
Message-ID: <4A000124.76EA.0078.0@novell.com>
References: <20090505111712.ae4649b3.sfr@canb.auug.org.au>
 <49FFFA36.76EA.0078.0@novell.com>
 <20090505064317.GA14708@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vpn.id2.novell.com ([195.33.99.129]:42965 "EHLO
	vpn.id2.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753026AbZEEHDU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2009 03:03:20 -0400
In-Reply-To: <20090505064317.GA14708@uranus.ravnborg.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, StevenWhitehouse <swhiteho@redhat.com>, linux-next@vger.kernel.org

>>> Sam Ravnborg <sam@ravnborg.org> 05.05.09 08:43 >>>
>On Tue, May 05, 2009 at 07:35:02AM +0100, Jan Beulich wrote:
>> That is the downside of not folding the 'const' modifier into the __initconst
>> annotation. It is *always* an error to annotate something __initconst but
>> not also make it const.
>
>But if we folded const in __initconst would this be correct:
>
>drivers/net/eql.c:static const char version[] __initconst =

No, of course not. __initconst would need to go in the place where const
is now. My original patch (from really long ago) did this, but you didn't like
that combination. Changing to such a model now (where we already have
quite a number of uses of __initconst) is certainly going to be painful, so
I'm not sure it's worth it. And if you would think now we should
nevertheless convert, we'd have to first check whether declarations of
more than one variable with a single declaration works with all supported
gcc versions (since there are a number of caveats with how __attribute__()
annotations are handled depending on their placement) - it may well be
that there would need to be a one-variable-per-declaration constraint on
users of __initconst & Co.

Jan
