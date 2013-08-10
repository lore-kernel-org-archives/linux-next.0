From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 9 (staging/ozwpan)
Date: Sat, 10 Aug 2013 16:15:55 -0700
Message-ID: <5206C9AB.8050706@infradead.org>
References: <20130809161540.f65dd6412ac59d49a32881c8@canb.auug.org.au>
 <5206BB86.2000604@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <5206BB86.2000604@infradead.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

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


-- 
~Randy
