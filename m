From: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: linux-next: Fixes tag needs some work in the nfs-anna tree
Date: Wed, 16 Jan 2019 10:24:20 -0500
Message-ID: <0014CBAD-D596-4DA5-B6DE-61160FFD033C@oracle.com>
References: <20190116083831.256824cf@canb.auug.org.au>
 <A4B834E5-2DFD-428E-8E24-9F6F6A822B09@oracle.com>
 <s5hbm4hfu45.wl-tiwai@suse.de> <20190115233811.GD26416@windriver.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115233811.GD26416@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Takashi Iwai <tiwai@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On Jan 15, 2019, at 6:38 PM, Paul Gortmaker =
<paul.gortmaker@windriver.com> wrote:

> [Re: linux-next: Fixes tag needs some work in the nfs-anna tree] On =
15/01/2019 (Tue 23:12) Takashi Iwai wrote:
>=20
>> On Tue, 15 Jan 2019 22:41:21 +0100,
>> Chuck Lever wrote:
>>>=20
>>> Hi Stephen-
>>>=20
>>> On Jan 15, 2019, at 4:38 PM, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>>>=20
>>>> [I am experimenting with checking the Fixes tags in commits in =
linux-next.
>>>> Please let me know if you think I am being too strict.]
>>>>=20
>>>> Hi all,
>>>>=20
>>>> Commit
>>>>=20
>>>> deaa5c96c2f7 ("SUNRPC: Address Kerberos performance/behavior =
regression")
>>>>=20
>>>> has problem with this Fixes tag:
>>>>=20
>>>> Fixes: 918f3c1fe83c ("SUNRPC: Improve latency for interactive ... =
")
>>>>=20
>>>> The subject should match the subject of the fixed commit.
>>>>=20
>>>> --=20
>>>> Cheers,
>>>> Stephen Rothwell
>>>=20
>>> I shortened the commit title so that the Fixes: line is shorter than =
68
>>> characters. I can leave these titles alone if that's preferred.
>>=20
>> I've sometimes shorted the subject like the above, too, as I find a
>> too long text annoying.  Maybe the partial string matching should
>> suffice, especially when it ends with "..." ?
>=20
> The problem is consistency.  Perhaps you shorten at four words.  A
> person searches with five words or 70 chars -  they never see your =
commit.
>=20
> The idea of consistency across the "Fixes:" tags is to allow a level =
of
> automated processing so that the creators of the stable releases can =
do
> a lot less manual hands-on processing.  They have enough work to do.

My impression was the scripted processing here relies on the commit
ID and not on the patch short description.

The convention of shortening the description with an ellipsis is
already widely used. I think it's reasonable to allow it.


--
Chuck Lever
