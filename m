From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [next-20190530] Boot failure on PowerPC
Date: Mon, 3 Jun 2019 08:41:50 +0530
Message-ID: <D8C9598F-4A51-4402-9344-894EC6B6CE47@linux.vnet.ibm.com>
References: <79EEB945-661A-41AD-8B26-2FD3B3F84697@linux.vnet.ibm.com>
 <87h89aohnu.fsf@concordia.ellerman.id.au>
 <CAA42JLYcPi4ypvX=Ma8yWzUCF=B=FkDrzLex=bJiLyryuWTE2g@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <CAA42JLYcPi4ypvX=Ma8yWzUCF=B=FkDrzLex=bJiLyryuWTE2g@mail.gmail.com>
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
To: Dexuan-Linux Cui <dexuan.linux@gmail.com>
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, v-lide@microsoft.com, Dexuan Cui <decui@microsoft.com>
List-Id: linux-next.vger.kernel.org



> On 31-May-2019, at 11:43 PM, Dexuan-Linux Cui <dexuan.linux@gmail.com> =
wrote:
>=20
> On Fri, May 31, 2019 at 6:52 AM Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>>>=20
>>> Machine boots till login prompt and then panics few seconds later.
>>>=20
>>> Last known next build was May 24th. Will attempt few builds till May =
30 to
>>> narrow down this problem.
>>=20
>> My CI was fine with next-20190529 (9a15d2e3fd03e3).
>>=20
>> cheers
>=20
> Hi Sachin,
> It looks this patch may fix the issue:
> https://lkml.org/lkml/2019/5/30/1630 , but I'm not sure.

It does not help fix the kernel panic issue, but it fixes the =
get_swap_device warning
messages during the boot.

Thanks
-Sachin
