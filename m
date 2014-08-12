From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the pm tree with Linus' tree
Date: Tue, 12 Aug 2014 03:11:06 +0200
Message-ID: <1531979.9XksH4oX0M@vostro.rjw.lan>
References: <20140811114309.1426067b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:65342 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750757AbaHLAwS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Aug 2014 20:52:18 -0400
In-Reply-To: <20140811114309.1426067b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>

On Monday, August 11, 2014 11:43:09 AM Stephen Rothwell wrote:
> 
> --Sig_/=CGwKOD1=eH3=syU/3wkRPC
> Content-Type: text/plain; charset=US-ASCII
> Content-Transfer-Encoding: quoted-printable
> 
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in
> arch/arm/mach-kirkwood/pm.c between commit ba364fc752da ("ARM:
> Kirkwood: Remove mach-kirkwood") from Linus' tree and commit
> bb3274b6442d ("PM / sleep: Rename symbols, functions and variables
> related to sleep") from the pm tree.
> 
> I fixed it up (I removed the file) and can carry the fix as necessary
> (no action is required).

Thanks a lot!

I've decided to drop the above commit for now.

Rafael
