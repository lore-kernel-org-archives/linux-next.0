From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the idle tree with the pm tree
Date: Tue, 14 Apr 2015 13:54:33 +0200
Message-ID: <8775330.2mU8ydLUZv@vostro.rjw.lan>
References: <20150414124709.5f981d3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:60635 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753178AbbDNLaB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2015 07:30:01 -0400
In-Reply-To: <20150414124709.5f981d3c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrey Semin <andrey.semin@intel.com>

On Tuesday, April 14, 2015 12:47:09 PM Stephen Rothwell wrote:
> 
> --Sig_/R75yz7NvQ/VA+OLEs7ruwVh
> Content-Type: text/plain; charset=US-ASCII
> Content-Transfer-Encoding: quoted-printable
> 
> Hi Len,
> 
> Today's linux-next merge of the idle tree got a conflict in
> tools/power/x86/turbostat/turbostat.c between commits from the pm tree
> and similar commits from the idle tree.
> 
> There seem to be two differnet version of these patches, so I just
> dropped the idle tree for today, please sort this out.

I've dropped the turbostat material (which apparently has been rebased after
I pulled it) from my linux-next branch.

Rafael
