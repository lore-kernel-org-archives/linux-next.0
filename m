From: Corey Minyard <cminyard@mvista.com>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Tue, 21 Jul 2015 18:45:33 -0500
Message-ID: <55AED99D.1060405@mvista.com>
References: <20150722082946.39366276@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150722082946.39366276@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 07/21/2015 05:29 PM, Stephen Rothwell wrote:
> Hi Corey,
>
> While fetching the ipmi tree
> (git://git.code.sf.net/p/openipmi/linux-ipmi#for-next), I get this
> error:
>
> fatal: unable to connect to git.code.sf.net:
> git.code.sf.net[0: 216.34.181.155]: errno=Connection refused
>
> I have been getting this for a few days now.  The http and https URLs
> don't work either (for me in Firefox).

Looks like sourceforge had a serious outage on the 18th and are still
working on restoring it. http://sourceforge.net/blog/category/sitestatus/

Would you like me to move this someplace else?

-corey
