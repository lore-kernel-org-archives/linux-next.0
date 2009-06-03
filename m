From: dmitry pervushin <dpervushin@embeddedalley.com>
Subject: Re: linux-next: ubi tree build failure
Date: Wed, 03 Jun 2009 17:05:43 +0400
Message-ID: <1244034343.4074.2.camel@hp.diimka.lan>
References: <20090603184408.49c7fb1f.sfr@canb.auug.org.au>
	 <4A265DF6.3070602@nokia.com>  <4A2672A8.8020809@nokia.com>
Reply-To: dpervushin@embeddedalley.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from easi.embeddedalley.com ([71.6.201.124]:33964 "HELO
	easi.embeddedalley.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753054AbZFCNM2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2009 09:12:28 -0400
In-Reply-To: <4A2672A8.8020809@nokia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem.Bityutskiy@nokia.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, 2009-06-03 at 15:55 +0300, Artem Bityutskiy wrote:
> Did not see compile error on x86 as well. Anyway, I have added more
> includes which seem to be missed. Hopefully this problem is fixed
> now. Thanks!
however it builds ok on arm too, adding #include <linux/err.h> should
fix this..
