From: Avi Kivity <avi@redhat.com>
Subject: Re: [PATCH] KVM: Remove old kvm_guest_debug structs
Date: Thu, 18 Dec 2008 13:40:06 +0200
Message-ID: <494A3696.7080506@redhat.com>
References: <20081218220526.b97c69e4.sfr@canb.auug.org.au> <494A34FE.3040607@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <494A34FE.3040607@siemens.com>
Sender: kvm-owner@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@redhat.com>, linux-next@vger.kernel.org, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Jan Kiszka wrote:
> Remove the remaining arch fragments of the old guest debug interface
> that now break non-x86 builds.
>
>   

Applied, thanks.

-- 
error compiling committee.c: too many arguments to function

