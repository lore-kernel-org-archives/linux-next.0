From: "Lili Deng (Wicresoft North America Ltd)" <v-lide@microsoft.com>
Subject: RE: [next-20190530] Boot failure on PowerPC
Date: Mon, 3 Jun 2019 03:23:34 +0000
Message-ID: <KL1P15301MB02948DA3C780A2DC4A145E0F9E140@KL1P15301MB0294.APCP153.PROD.OUTLOOK.COM>
References: <79EEB945-661A-41AD-8B26-2FD3B3F84697@linux.vnet.ibm.com>
 <87h89aohnu.fsf@concordia.ellerman.id.au>
 <CAA42JLYcPi4ypvX=Ma8yWzUCF=B=FkDrzLex=bJiLyryuWTE2g@mail.gmail.com>
 <D8C9598F-4A51-4402-9344-894EC6B6CE47@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <D8C9598F-4A51-4402-9344-894EC6B6CE47@linux.vnet.ibm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, Dexuan-Linux Cui <dexuan.linux@gmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dexuan Cui <decui@microsoft.com>
List-Id: linux-next.vger.kernel.org

Hi Sachin,

I verified below patch against Ubuntu 18.04, didn't hit the kernel panic an=
y more, could you please let know how did you verify?

Thanks,
Lili
-----Original Message-----
From: Sachin Sant <sachinp@linux.vnet.ibm.com>=20
Sent: Monday, June 3, 2019 11:12 AM
To: Dexuan-Linux Cui <dexuan.linux@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>; linuxppc-dev@lists.ozlabs.org; l=
inux-next@vger.kernel.org; Dexuan Cui <decui@microsoft.com>; Lili Deng (Wic=
resoft North America Ltd) <v-lide@microsoft.com>
Subject: Re: [next-20190530] Boot failure on PowerPC



> On 31-May-2019, at 11:43 PM, Dexuan-Linux Cui <dexuan.linux@gmail.com> wr=
ote:
>=20
> On Fri, May 31, 2019 at 6:52 AM Michael Ellerman <mpe@ellerman.id.au> wro=
te:
>>>=20
>>> Machine boots till login prompt and then panics few seconds later.
>>>=20
>>> Last known next build was May 24th. Will attempt few builds till May=20
>>> 30 to narrow down this problem.
>>=20
>> My CI was fine with next-20190529 (9a15d2e3fd03e3).
>>=20
>> cheers
>=20
> Hi Sachin,
> It looks this patch may fix the issue:
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkml.=
org%2Flkml%2F2019%2F5%2F30%2F1630&amp;data=3D02%7C01%7Cv-lide%40microsoft.c=
om%7C66e1ef6017aa461703f808d6e7d148cd%7C72f988bf86f141af91ab2d7cd011db47%7C=
1%7C1%7C636951283393233385&amp;sdata=3DIJFhtvL2Bd87HCoMZ7oWL%2Bar6NY%2FfPbm=
dCZMT%2BJz5t4%3D&amp;reserved=3D0 , but I'm not sure.

It does not help fix the kernel panic issue, but it fixes the get_swap_devi=
ce warning messages during the boot.

Thanks
-Sachin
