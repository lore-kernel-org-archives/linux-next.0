From: Ken Cox <jkc@redhat.com>
Subject: Re: linux-next: Tree for Jul 3 (staging/unisys)
Date: Thu, 03 Jul 2014 10:41:39 -0500
Message-ID: <53B579B3.8040004@redhat.com>
References: <20140703155305.416bf8c7@canb.auug.org.au>
 <53B5777C.2050307@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <53B5777C.2050307@infradead.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ben Romer <sparmaintainer@unisys.com>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 07/03/2014 10:32 AM, Randy Dunlap wrote:
> On 07/02/14 22:53, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20140702:
>>
> on x86_64:
>
> CONFIG_UNISYSSPAR=y
> CONFIG_UNISYS_VISORUTIL=m
> # CONFIG_UNISYS_VISORCHANNEL is not set
> CONFIG_UNISYS_CHANNELSTUB=y
>
> drivers/built-in.o: In function `channel_mod_init':
> chanstub.c:(.init.text+0x10a8f): undefined reference to `unisys_spar_platform'
>
>
> because CHANNELSTUB=y and VISORUTIL=m.
Hi Randy,

I have submitted a patch to fix this.

Thanks for the reply.

--
Ken
