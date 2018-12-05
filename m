From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: linux-next: manual merge of the selinux tree with the vfs tree
Date: Wed, 5 Dec 2018 13:58:41 -0800
Message-ID: <eae92504-4c1d-2430-4d5b-b5b1f4af45ce@schaufler-ca.com>
References: <20181127115246.00967523@canb.auug.org.au>
 <CAFqZXNs6XTOx2-EQ5P9bK3vPsPby7rzryHPqzqsVD9XsbsG20w@mail.gmail.com>
 <20181127225013.133adc7d@canb.auug.org.au>
 <CAHC9VhSFSxBc+-O=GQMkiyiQz3S+_ZreicLhsoAuvR-oq2mi6g@mail.gmail.com>
 <CAFqZXNuZCof=7CtyMq8JDyAgRmONYRZhhqr6bFVy9-F70-Uwrw@mail.gmail.com>
 <CAFqZXNu_=MxcX5jvX4y=5nrCqi7_btOGVccbH1NZ=xm3TGvaYQ@mail.gmail.com>
 <CAFqZXNv642dfT0PpB0M7sO5J90cAM7Luv0A8nX7JtEXqw=yu1w@mail.gmail.com>
 <CAFqZXNuv_mF8Yt50J3giZjxzZX_WwCOePZeEtmR-G_m+vRyPrQ@mail.gmail.com>
 <20181203215639.GV2217@ZenIV.linux.org.uk>
 <CAFqZXNvSOzyhnTUxF2mP4BTFMVQ8H1uh-Yyn2fH2K=4yRDX-tQ@mail.gmail.com>
 <20181205161601.GW2217@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205161601.GW2217@ZenIV.linux.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>, Ondrej Mosnacek <omosnace@redhat.com>
Cc: Paul Moore <paul@paul-moore.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, selinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, LSM <linux-security-module@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 12/5/2018 8:16 AM, Al Viro wrote:
> On Wed, Dec 05, 2018 at 10:37:56AM +0100, Ondrej Mosnacek wrote:
>
>> I just tested the Q28 branch rebased onto a recent Fedora rawhide
>> kernel (4.20.0-0.rc5.git0.1) and that code seems to be working fine.

Not so good with Smack.

	# mount -t tmpfs -o size=512m,smackfsroot=Pop tmpfs /mnt
	# attr -S -g SMACK64 /mnt
	Attribute "SMACK64" had a 1 byte value for /mnt:
	_
	#

attr should have reported a 3 byte value "Pop".
