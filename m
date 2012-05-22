From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: bad commit in the cgroup tree
Date: Tue, 22 May 2012 15:37:25 -0700
Message-ID: <CAOS58YOK5coLZ1kh+7WDX7+cE83oXJoJRZ0Zzv6C_kzSAV1ZZw@mail.gmail.com>
References: <20120523083437.e4d3f7ed9b11aae3c51dc2ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120523083437.e4d3f7ed9b11aae3c51dc2ae@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hello, Stephen.

On Tue, May 22, 2012 at 3:34 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> The top commit of the cgroup tree (e4968362bd46 "WIP") should not be =
in
> linux-next. =A0In fact it looks like you committed your quilt series =
by
> accident.
>
> I will use the cgroup tree from next-20120522 for today.

Sorry, I apparently executed git commit in the wrong directory. Fixed.

Thank you.

--=20
tejun
