From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [LKP] [sunrpc] 6a7da2a288: kernel_BUG_at_lib/iov_iter.c
Date: Sat, 3 Nov 2018 15:49:43 +0000
Message-ID: <AM0PR04MB42907C7E4A7E1B09ED7B6BBEEEC80@AM0PR04MB4290.eurprd04.prod.outlook.com>
References: <20181102001633.GD24195@shao2-debian>
 <7958.1541119812@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel test robot <rong.a.chen@intel.com>, "J. Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lkp@01.org" <lkp@01.org>
List-Id: linux-next.vger.kernel.org

On 11/2/2018 2:50 AM, David Howells wrote:=0A=
> kernel test robot <rong.a.chen@intel.com> wrote:=0A=
> =0A=
>> FYI, we noticed the following commit (built with gcc-7):=0A=
>>=0A=
>> commit: 6a7da2a288ce412d7ac117a2912a7b0d9104ee6d ("[RFC] sunrpc: Fix flo=
od of warnings from iov_iter_kvec in linux-next")=0A=
>> url: https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FLeonard-Crestez%2Fsunrpc-Fix-flo=
od-of-warnings-from-iov_iter_kvec-in-linux-next%2F20181101-070713&amp;data=
=3D02%7C01%7Cleonard.crestez%40nxp.com%7C0b22a6d58a5242277ca008d6405d28b3%7=
C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636767166190134069&amp;sdata=3D=
335WGS8H6GRfqp%2BDmocDQ8mowhe7a0RxKbfM6rSgJ3g%3D&amp;reserved=3D0=0A=
>> base: git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next=
=0A=
>>=0A=
>> in testcase: boot=0A=
>>=0A=
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu kvm64,+ssse3 -smp 2=
 -m 8G=0A=
>>=0A=
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):=0A=
> =0A=
> Ummm...  You can't just apply that commit to Trond's linux-next branch un=
less=0A=
> that branch also includes the iov_iter changes from my afs-next branch.=
=0A=
> =0A=
> Before those changes, ITER_KVEC is required:=0A=
> =0A=
> 	BUG_ON(!(direction & ITER_KVEC));=0A=
> =0A=
> and after, it will be prohibited:=0A=
> =0A=
> 	WARN_ON(direction & ~(READ | WRITE));=0A=
> =0A=
> The reason for this is that have yet more patches that split the directio=
n=0A=
> from the iov_iter::type member into their own member and turn the types i=
nto a=0A=
> simple integer sequence instead of a bit mask.=0A=
=0A=
It's not clear how such conflicts should be handled. Maybe patches from =0A=
one tree should be pulled into the other earlier so that merging "just =0A=
works"?=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
