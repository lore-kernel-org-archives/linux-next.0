From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: build failure after merge of the wireless-next tree
Date: Wed, 16 Jul 2014 10:09:06 -0400
Message-ID: <20140716140905.GE13555@tuxdriver.com>
References: <20140716132851.5b974707@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140716132851.5b974707@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Raphael Silva <rapphil@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 16, 2014 at 01:28:51PM +1000, Stephen Rothwell wrote:
> Hi John,
> 
> After merging the wireless-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/rtl8723au/core/rtw_sta_mgt.c: In function 'rtw_free_stainfo23a':
> drivers/staging/rtl8723au/core/rtw_sta_mgt.c:254:27: error: expected expression before ';' token
>   pstapriv->asoc_sta_count-;
>                            ^
> 
> Caused by commit 3dd51964026e ("rtl8723au: Corrections in the coding
> style") (its always the cleanup patches that cause problems :-))
> Please unit test *all* patches.
> 
> I have used the wireless-next tree from next-20140715 for today.

I'm dropping that one -- merging it was accidental anyway.

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
