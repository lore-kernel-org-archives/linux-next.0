From: "Gujare, Rupesh" <Rupesh.Gujare@atmel.com>
Subject: RE: linux-next: Tree for Aug 9 (staging/ozwpan)
Date: Sun, 11 Aug 2013 09:04:00 +0000
Message-ID: <CB57019DFBA97B45884DCA732411B955341FA6C8@hnombx02.corp.atmel.com>
References: <20130809161540.f65dd6412ac59d49a32881c8@canb.auug.org.au>
 <5206BB86.2000604@infradead.org>,<5206C9AB.8050706@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <5206C9AB.8050706@infradead.org>
Content-Language: en-GB
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


________________________________________
From: Randy Dunlap [rdunlap@infradead.org]
Sent: 11 August 2013 00:15
To: Stephen Rothwell
Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; devel@driverdev.osuosl.org; Gujare, Rupesh; Greg Kroah-Hartman
Subject: Re: linux-next: Tree for Aug 9 (staging/ozwpan)

On 08/10/13 15:15, Randy Dunlap wrote:
> On 08/08/13 23:15, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20130808:
>>
>> *crickets*
>>
>
> on i386:
>
> ERROR: "__divdi3" [drivers/staging/ozwpan/ozwpan.ko] undefined!
>

2 occurrences of this in oz_hcd_heartbeat().

>
>
> Apologies if this has already been reported/fixed.
>

Yes, It had been already been fixed here :-

http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2013-August/040091.html
I have been waiting for Greg to apply this patch to his tree.

--
Regards,
Rupesh Gujare
