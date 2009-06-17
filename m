From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm/powerpc tree build failure
Date: Wed, 17 Jun 2009 16:49:51 +0300
Message-ID: <4A38F47F.509@redhat.com>
References: <20090617150419.e406a69a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20090617150419.e406a69a.sfr@canb.auug.org.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org
List-Id: linux-next.vger.kernel.org

On 06/17/2009 08:04 AM, Stephen Rothwell wrote:
> From: Stephen Rothwell<sfr@canb.auug.org.au>
> Date: Wed, 17 Jun 2009 14:57:29 +1000
> Subject: [PATCH] kvm/powerpc: make 32 bit constant unsigned long
>
> KVM_PAGES_PER_HPAGE needs to be unsigned long since its value is 2^31.
>
> Eliminates this compiler warning:
>
>    

Thanks, applied.  For some reason my own build testing didn't fail on this.

-- 
Do not meddle in the internals of kernels, for they are subtle and quick to panic.
