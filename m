From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH next] powerpc/5200: fix building GPT driver without sysfs
Date: Mon, 16 Mar 2009 10:22:43 -0600
Message-ID: <fa686aa40903160922w7b2e20efxbb5aa5cd1621903e@mail.gmail.com>
References: <20090316161751.GA3622@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
In-Reply-To: <20090316161751.GA3622@orion>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Mar 16, 2009 at 10:17 AM, Alexander Beregalov
<a.beregalov@gmail.com> wrote:
> arch/powerpc/platforms/52xx/mpc52xx_gpt.c: In function 'mpc52xx_gpt_create_attribs':
> arch/powerpc/platforms/52xx/mpc52xx_gpt.c:373: error: parameter name omitted
> arch/powerpc/platforms/52xx/mpc52xx_gpt.c:373: warning: 'return' with a value, in function returning void
>
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

A patch has already been queued in the next branch of
git://git.secretlab.ca/git/linux-2.6-mpc52xx which removes the sysfs
code from this driver entirely.  Ben just hasn't pulled it into his
-next branch yet.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
