From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: byteorder headers on parisc
Date: Tue, 09 Dec 2008 15:12:37 -0800
Message-ID: <1228864357.5480.2.camel@brick>
References: <20081209185237.8bb715d7.sfr@canb.auug.org.au>
	 <20081209135714.GB7785@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.224]:15891 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754767AbYLIXOs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 18:14:48 -0500
Received: by rv-out-0506.google.com with SMTP id k40so157738rvb.1
        for <linux-next@vger.kernel.org>; Tue, 09 Dec 2008 15:14:47 -0800 (PST)
In-Reply-To: <20081209135714.GB7785@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au

On Tue, 2008-12-09 at 16:57 +0300, Alexey Dobriyan wrote:
> May I politely ask how this was compiled-tested?

It wasn't.  I missed the usage of the internal __fswabXX on parisc,
Kyle already contected me yesterday about this and worked out
a fix.

Harvey
