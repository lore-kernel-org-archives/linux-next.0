From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [Fwd: FW: linux-next: manual merge of the crypto tree]
Date: Mon, 25 Aug 2008 14:32:46 +0200
Message-ID: <20080825123246.GA8663@elte.hu>
References: <1219661427.25749.11.camel@austinz.bj.intel.com.bj.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:50022 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753547AbYHYMdM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 08:33:12 -0400
Content-Disposition: inline
In-Reply-To: <1219661427.25749.11.camel@austinz.bj.intel.com.bj.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Austin Zhang <austin_zhang@linux.intel.com>
Cc: herbert@gondor.apana.org.au, sfr@canb.auug.org.au, linux-next@vger.kernel.org, tglx@linutronix.de, hpa@zytor.com


* Austin Zhang <austin_zhang@linux.intel.com> wrote:

> A =EF=BB=BFstandalone patch to add sse42 flags.

a proper changelog with signoffs, etc. would be nice.

> (But, Ingo, I thought this would still make conflicts when Stephen=20
> want to merge into crypto tree, right?)

i can make the commit a separate branch that you can pull. (without=20
pulling anything else)

(as long as the crypto tree is git based, which i assume it is.)

	Ingo
