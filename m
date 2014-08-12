From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: make mandocs error with next-20140812
Date: Tue, 12 Aug 2014 10:14:22 -0700
Message-ID: <53EA4B6E.9000500@infradead.org>
References: <CA+r1Zhip1SZww=sueoRJD=ZzekqLJjeY7O461wnFVRdsuz+eWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:40308 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753213AbaHLRO1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Aug 2014 13:14:27 -0400
In-Reply-To: <CA+r1Zhip1SZww=sueoRJD=ZzekqLJjeY7O461wnFVRdsuz+eWg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-doc <linux-doc@vger.kernel.org>

On 08/12/14 10:12, Jim Davis wrote:
> docproc: .//drivers/gpu/drm/drm_stub.c: No such file or directory
> make[1]: *** [Documentation/DocBook/drm.xml] Error 1
> make: *** [mandocs] Error 2
> --

Known and patch has been submitted.  I'll try to get it merged.

-- 
~Randy
