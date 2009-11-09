From: Luciano Coelho <luciano.coelho@nokia.com>
Subject: Re: linux-next: Tree for November 2 (wireless/wl1271)
Date: Mon, 09 Nov 2009 13:20:55 +0200
Message-ID: <4AF7FB17.7020604@nokia.com>
References: <20091102173845.210d1c57.sfr@canb.auug.org.au>	<4AEF1E7F.50306@oracle.com> <20091102184449.GJ14046@tuxdriver.com>	<20091102184843.GK14046@tuxdriver.com> <4AEF4ACB.5040302@nokia.com>	<4AEFC7CF.1020909@nokia.com> <87ljiifwnc.fsf@purkki.valot.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754593AbZKILVp@vger.kernel.org>
In-Reply-To: <87ljiifwnc.fsf@purkki.valot.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: ext Kalle Valo <kalle.valo@iki.fi>
Cc: "ext John W. Linville" <linville@tuxdriver.com>, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

ext Kalle Valo wrote:
> Luciano Coelho <luciano.coelho@nokia.com> writes:
> 
>> Coelho Luciano (Nokia-D/Helsinki) wrote:
>>> ext John W. Linville wrote:
>>>> Helps if I actually Cc: Luca...
>>> Yes, it does. :) I would see this at some point but CCing me speed
>>> things up quite a lot.
>>
>> BTW, I think we need this for wl1251 as well.  CC'ing Kalle too.
> 
> Thanks, but upstream wl1251 doesn't have ARP filter. There is an
> internal patch but I haven't submitted it, yet.

Oh, okay.  Sorry for not checking.  I just noticed that our wl1271 
implementation was based on the implementation for wl1251, so I just assumed it 
was needed as well.

-- 
Cheers,
Luca.
