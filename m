From: Bryan Wu <bryan.wu@canonical.com>
Subject: Re: linux-next: Tree for Jun 14 (leds)
Date: Fri, 15 Jun 2012 11:42:52 +0800
Message-ID: <CAK5ve-JMkdir+NcKq47hBQ4Jcbh2WkqeiSohqp3AcQchbsMe5w@mail.gmail.com>
References: <20120614162901.798d7661ea87e6134eee6f3a@canb.auug.org.au> <4FDA5C8B.401@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FDA5C8B.401@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Jun 15, 2012 at 5:50 AM, Randy Dunlap <rdunlap@xenotime.net> wr=
ote:
> On 06/13/2012 11:29 PM, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20120613:
>>
>> Linus' tree gained a build failure for which I reverted a commit.
>>
>> The net-next tree lost its conflicts but gained another against the
>> wireless tree.
>>
>> The sound-asoc tree lost its build failure.
>>
>> The leds tree lost its build failure.
>>
>> --------------------------------------------------------------------=
--------
>>
>> I have created today's linux-next tree at
>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> (patches at http://www.kernel.org/pub/linux/kernel/next/ ). =A0If yo=
u
>> are tracking the linux-next tree using git, you should not use "git =
pull"
>> to do so as that will try to merge the new linux-next release with t=
he
>> old one. =A0You should use "git fetch" as mentioned in the FAQ on th=
e wiki
>> (see below).
>>
>> You can see which trees have been included by looking in the Next/Tr=
ees
>> file in the source. =A0There are also quilt-import.log and merge.log=
 files
>> in the Next directory. =A0Between each merge, the tree was built wit=
h
>> a ppc64_defconfig for powerpc and an allmodconfig for x86_64. After =
the
>> final fixups (if any), it is also built with powerpc allnoconfig (32=
 and
>> 64 bit), ppc44x_defconfig and allyesconfig (minus
>> CONFIG_PROFILE_ALL_BRANCHES - this fails its final link) and i386, s=
parc
>> and sparc64 defconfig. These builds also have
>> CONFIG_ENABLE_WARN_DEPRECATED, CONFIG_ENABLE_MUST_CHECK and
>> CONFIG_DEBUG_INFO disabled when necessary.
>>
>> Below is a summary of the state of the merge.
>>
>> We are up to 189 trees (counting Linus' and 26 trees of patches pend=
ing
>> for Linus' tree), more are welcome (even if they are currently empty=
).
>> Thanks to those who have contributed, and to those who haven't, plea=
se do.
>>
>> Status of my local build tests will be at
>> http://kisskb.ellerman.id.au/linux-next . =A0If maintainers want to =
give
>> advice about cross compilers/configs that work, we are always open t=
o add
>> more builds.
>>
>> Thanks to Randy Dunlap for doing many randconfig builds. =A0And to P=
aul
>> Gortmaker for triage and bug fixes.
>>
>> There is a wiki covering stuff to do with linux-next at
>> http://linux.f-seidel.de/linux-next/pmwiki/ . =A0Thanks to Frank Sei=
del.
>
>
>
> on i386:
>
> ERROR: "led_brightness_set" [drivers/leds/led-class.ko] undefined!
> ERROR: "leds_list" [drivers/leds/led-class.ko] undefined!
> ERROR: "leds_list_lock" [drivers/leds/led-class.ko] undefined!
>
> and possibly related:
>
> warning: (ADB_PMU_LED && IWLWIFI && IWLEGACY && ATH5K && ATH9K && ATH=
9K_HTC && CARL9170_LEDS && TABLET_USB_WACOM && INPUT_WISTRON_BTNS && SE=
NSORS_APPLESMC && IR_WINBOND_CIR && BACKLIGHT_ADP8860 && BACKLIGHT_ADP8=
870 && HID_LENOVO_TPKBD && ACER_WMI && ASUS_LAPTOP && DELL_LAPTOP && HP=
_ACCEL && THINKPAD_ACPI && EEEPC_LAPTOP && ASUS_WMI && ACPI_TOSHIBA && =
SAMSUNG_LAPTOP) selects LEDS_CLASS which has unmet direct dependencies =
(NEW_LEDS)
>
>
> Full randconfig file is attached.
>

Hi Randy,

I tried to build linux-next latest kernel with the randconfig you
posted here, but didn't met this building failure. Did I miss
something?

Thanks,
--=20
Bryan Wu <bryan.wu@canonical.com>
Kernel Developer =A0 =A0+86.186-168-78255 Mobile
Canonical Ltd. =A0 =A0 =A0www.canonical.com
Ubuntu - Linux for human beings | www.ubuntu.com
