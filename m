From: Jesse Gross <jesse@nicira.com>
Subject: Re: [-next] openvswitch BUILD_BUG_ON failed
Date: Thu, 29 Aug 2013 14:42:22 -0700
Message-ID: <CAEP_g=-XvRiHPzSAp2rgC9Hxdd+pGEHvSTEJ1A1SkWnk1-6xZA@mail.gmail.com>
References: <CAMuHMdVG9FmZNayrf7HMz4kC4X5QELeXUFjjzpAM80ND_QOm8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVG9FmZNayrf7HMz4kC4X5QELeXUFjjzpAM80ND_QOm8A@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andy Zhou <azhou@nicira.com>, "dev@openvswitch.org" <dev@openvswitch.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 29, 2013 at 2:21 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> However, I have some doubts about other alignment "enforcements":
>
> "__aligned(__alignof__(long))" makes the whole struct aligned to the
> alignment rule for "long":
>    1. This is only 2 bytes on m68k, i.e. != sizeof(long).
>    2. This is 4 bytes on many 32-bit platforms, which may be less than the
>       default alignment for "__be64" (cfr. some members of struct
>       ovs_key_ipv4_tunnel), so this may make those 64-bit members unaligned.

Do any of those 32-bit architectures actually care about alignment of
64 bit values? On 32-bit x86, a long is 32 bits but the alignment
requirement of __be64 is also 32 bit.
