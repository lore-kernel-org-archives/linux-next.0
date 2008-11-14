From: "J.R. Mauro" <jrm8005@gmail.com>
Subject: Re: Can you add the staging tree to -next?
Date: Fri, 14 Nov 2008 17:28:17 -0500
Message-ID: <3aaafc130811141428ta97f929va8c62cbcdbc731f7@mail.gmail.com>
References: <20081112235600.GA27554@kroah.com>
	 <Pine.LNX.4.64.0811140825410.11953@anakin>
	 <20081114173258.GC22980@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.224]:4226 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751259AbYKNW2S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Nov 2008 17:28:18 -0500
Received: by rv-out-0506.google.com with SMTP id k40so1580160rvb.1
        for <linux-next@vger.kernel.org>; Fri, 14 Nov 2008 14:28:17 -0800 (PST)
In-Reply-To: <20081114173258.GC22980@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

There also seem to be a lot of build errors that no one hacking on
staging has seen before being threshed out by all the randconfig tests
done on -next, which will help a lot if we want the staging drivers to
actually go anywhere.

~J.R.
