From: Avi Kivity <avi@redhat.com>
Subject: Re: [PATCH -next] kvm: fix const value warning on i386
Date: Sun, 24 Apr 2011 10:12:30 +0300
Message-ID: <4DB3CD5E.4000507@redhat.com>
References: <20110421132045.5af1b953.sfr@canb.auug.org.au> <20110421090922.4d9a275b.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <20110421090922.4d9a275b.randy.dunlap@oracle.com>
Sender: kvm-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Marcelo Tosatti <mtosatti@redhat.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 04/21/2011 07:09 PM, Randy Dunlap wrote:
> From: Randy Dunlap<randy.dunlap@oracle.com>
>
> arch/x86/kvm/emulate.c:2598: warning: integer constant is too large for 'long' type

Applied, thanks.

-- 
I have a truly marvellous patch that fixes the bug which this
signature is too narrow to contain.

