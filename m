From: Stephan Mueller <smueller@chronox.de>
Subject: Re: linux-next: build failure after merge of the crypto tree
Date: Thu, 28 May 2015 15:08:58 +0200
Message-ID: <3222363.EiigN6lC90@tauon>
References: <20150528214049.747115f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.eperm.de ([89.247.134.16]:58338 "EHLO mail.eperm.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752299AbbE1NJJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 May 2015 09:09:09 -0400
In-Reply-To: <20150528214049.747115f0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Am Donnerstag, 28. Mai 2015, 21:40:49 schrieb Stephen Rothwell:

Hi Stephen,

>Hi Herbert,
>
>After merging the crypto tree, today's linux-next build (powerpc
>allyesconfig) failed like this:
>
>crypto/jitterentropy.c: In function 'jent_get_nstime':
>crypto/jitterentropy.c:135:5: error: implicit declaration of function
>'timekeeping_valid_for_hres' [-Werror=implicit-function-declaration] (0 ==
>timekeeping_valid_for_hres()) &&
>     ^
>
>Caused by commit bb5530e40824 ("crypto: jitterentropy - add
>jitterentropy RNG").
>
>I have reverted that commit for today.

The fix has been added to the cryptodev-2.6 this morning: 
cf58fcb1bea9e0fcf3447bdb959ef5bcd22cfbcb


Ciao
Stephan
