From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
Subject: Re: linux-next: build failure after merge of the final tree (hid
 tree related)
Date: Thu, 1 Apr 2010 09:53:04 +0200
Message-ID: <20100401095304.487fffb4@pluto.restena.lu>
References: <20100401170639.9f2fe605.sfr@canb.auug.org.au>
	<alpine.LNX.2.00.1004010817420.8345@pobox.suse.cz>
	<20100401183530.516bbca6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100401183530.516bbca6.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Jiri, Stephen,

Wondering why x86 (32bit and 64bit) does not need to include the
header but other arches (at least powerpc) need it.

Any idea via which header linux/uaccess.h gets included on x86?
If nobody has checked by the time I get home I will determine that.

Thanks,
Bruno


On Thu, 1 Apr 2010 18:35:30 Stephen Rothwell wrote:
> Hi Jiri,
> 
> On Thu, 1 Apr 2010 08:18:43 +0200 (CEST) Jiri Kosina
> <jkosina@suse.cz> wrote:
> >
> > On Thu, 1 Apr 2010, Stephen Rothwell wrote:
> > 
> > > After merging the final tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > > 
> > > drivers/hid/hid-picolcd.c: In function
> > > 'picolcd_debug_reset_write': drivers/hid/hid-picolcd.c:1343:
> > > error: implicit declaration of function 'copy_from_user'
> > > drivers/hid/hid-picolcd.c: In function
> > > 'picolcd_debug_eeprom_read': drivers/hid/hid-picolcd.c:1407:
> > > error: implicit declaration of function 'copy_to_user'
> > > 
> > > Caused by commit 9bbf2b98ba11d00bd73e3254e15cfe17ccaff6ba ("HID:
> > > add experimental access to PicoLCD device's EEPROM and FLASH").
> > > Using copy_ {to,from}_user requires the include of
> > > linux/uaccess.h.
> > > 
> > > I have reverted that commit for today.
> > 
> > Hmm, on which arch did this bomb out? I wonder why it is building
> > fine for me.
> 
> PowerPC (see above).  It could also be some interaction with another
> tree in linux-next.
> 
> > Anyway, I have added the include, as it is obviously correct(tm),
> > thanks for reporting it.
> 
> Thanks.
> 
