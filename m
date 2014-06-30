From: Ken Cox <jkc@redhat.com>
Subject: Re: randconfig build error with next-20140630,
 in drivers/staging/unisys/channels/chanstub.c
Date: Mon, 30 Jun 2014 11:16:41 -0500
Message-ID: <53B18D69.4020008@redhat.com>
References: <CA+r1ZhjS1T6gHZRur8m4gm-=izvQTBGny2ivynzLY2jqJaevsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CA+r1ZhjS1T6gHZRur8m4gm-=izvQTBGny2ivynzLY2jqJaevsw@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, benjamin.romer@unisys.com, david.kershner@unisys.com, sparmaintainer@unisys.com, devel <devel@driverdev.osuosl.org>, gregkh@linuxfoundation.org
List-Id: linux-next.vger.kernel.org


On 06/30/2014 11:13 AM, Jim Davis wrote:
> Building with the attached random configuration file,
>
> drivers/built-in.o: In function `channel_mod_init':
> chanstub.c:(.init.text+0xcbcf): undefined reference to `unisys_spar_platform'
> make: *** [vmlinux] Error 1
Hi Jim,

I have already submitted a patch to correct this. The kbuild test robot 
uncovered it also.

Thanks for the report,
Ken
