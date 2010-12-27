From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: linux-next: Tree for December 27
Date: Mon, 27 Dec 2010 15:57:54 +0100
Message-ID: <4D18A972.1020205@example.com>
References: <20101227170451.a9a9f873.sfr@canb.auug.org.au>	<4D18A480.2060309@example.com> <AANLkTi=WhSP1ceHBW95n1e-gHwwnt36h3czFGuKsEny6@mail.gmail.com>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=WhSP1ceHBW95n1e-gHwwnt36h3czFGuKsEny6@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sedat.dilek@gmail.com
Cc: Sedat Dilek <sedat.dilek@googlemail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 27.12.2010 15:48, Sedat Dilek wrote:
> 2010/12/27 Piotr Hosowicz<piotr@hosowicz.com>:
>> On 27.12.2010 07:04, Stephen Rothwell wrote:
>>
>> Hello,
>>
>> I noticed that after first reboot with this kernel that my MP3 colle=
ction in
>> mocp layed on Ext4 fs opens painfully slow. It is not my mistake, be=
cause I
>> always do it the same way, new kernel, then music on. The problem is=
 not
>> present in rc7-git4. I could measure it in some way (timing ls -la i=
n tht
>> dir?) if somebody needs it.
>>
>> Regards,
>>
>> Piotr Hosowicz
>>
>
> You tried mblk_io_submit mount-option for that partition?

No, I do not use it, I do not even know what it is. My options are:

/dev/sda2 on / type ext4 (rw,errors=3Dremount-ro)

Regards,

Piotr Hosowicz

--=20
Jest jedna korzy=B6=E6 z posiadania TV - jak dobrze
rozregulujesz odbiornik, trafisz na promieniowanie
mikrofalowe z pocz=B1tk=F3w Wszech=B6wiata.
NP: Peter Green Splinter Group - Burglar
NB: 2.6.37-rc7-next-20101227
