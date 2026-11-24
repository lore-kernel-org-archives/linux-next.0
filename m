Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536363;
	b=FBIDWdLtafazLrQKPF3syS+8sOA8gIGSSjjWJwc3dE5lTK0h0UPRvb4QSqJLZYRALyjI
	 wMwlsIpeMxkgylXd53x8uSfKC0zWCT2nGPsoNnXLrFUAIeVqlN5Q61YBsCQrJb6Q9x9TR
	 zn+mQSDrkj30N0Fatvv8TKqORJw8lNYBbzMKuelGbJacWd5y4kBWrvXFU7sMFR39UCfDw
	 oKh5ItiA43Auhl8jkoDJ0261ZbuG249h0tES+jPgesaNvb0jsNjI9v5nZBaadIvpLJqRN
	 BbAsk0qvipWN/RGGYUIElVshU6hHUMQ4tT7kjATMG0OGukdMiok6C1TQeyfGhrsvskQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536363;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=U8rv1eCefbjg754Nj50EdvETPdfOMzOC948bjBUBSAQ=;
	b=BAcT4F6FZ7HWAHeDUjzlOqQ5wixq7fawQkxDT+Ztaqr+bQtbv6FL6GmFatdYUPqhXFoR
	 DlHSYr6mD/AP0QsZAeA19eb5iY2IYcSG0kusFEDpCvEFXBBIS82UTxSIVABv6s8YJyIUN
	 7pasUbVuE26VKvU/GLAa/cAaqCI7RARoZRu89lXgyeJ065iUuY/mJ75Ko12b9ufcNTGse
	 EYZmEaBYu8DubfiiA/tHSnKW20yLqonOK0wWj0/Lh9pNPRx8Cur3wwZvWZyFzGV1gw3sm
	 ANIy4aMIJam1jLVVWhlmzetDh0Fu/tr6loXYo+s/8eNYwGfzAqXpY8RLTBVfDf8ewMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=acGqAlDP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AC0606A321;
	Tue, 24 Nov 2026 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=acGqAlDP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4191F000C6;
	Tue, 24 Nov 2026 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795536362;
	bh=U8rv1eCefbjg754Nj50EdvETPdfOMzOC948bjBUBSAQ=;
	h=Date:From:To:Cc:Subject;
	b=acGqAlDP85MsxW9ke3caCKLd3jnWisvxWd92cb/XS6Hnd3iL/cMhvhY1Hzcv/gZ47
	 yVlwY8WmVY8Q3VEvz22iTypz7RyfyhALNp1Ccp8lfNb6tkBds79hKiYxWEyb2L6Trm
	 PgoFU5ZbjyWuHdi/tfG8YNbehPg+1sRNDZT9vDAIcgjvuwHKZpdL2vgC1b8auMyD62
	 voOK7q3BbyRMlXRLetKxEx93xyplhx3n4nhjrdDKH/kdXLOnQlIGvZio+j1abIeqn4
	 DCibo+EijJy9Ut/sPz4rPi/LCN2PBn5BfumoQ4ANJBNWSU4lOIBs5WS4p3E9shunfI
	 0LRtJ3N957ddQ==
Date: Tue, 24 Nov 2026 16:05:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Juergen Gross <jgross@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <awW15Y9UfTqy_AyB@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xQrRqVnsR/JTQZh0"
Content-Disposition: inline


--xQrRqVnsR/JTQZh0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/thermal/intel/therm_throt.c

between commit:

  47b5cb24866c0 ("thermal: intel: Move the sysfs device helpers next to the=
ir callers")

=66rom the pm tree and commit:

  e7f9f17e00130 ("treewide: Convert rdmsrq() from a macro to an inline func=
tion")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/thermal/intel/therm_throt.c
index 1688f6362f6f5,6f86eb0231321..0000000000000
--- a/drivers/thermal/intel/therm_throt.c
+++ b/drivers/thermal/intel/therm_throt.c
@@@ -480,613 -474,6 +480,613 @@@ static int __init int_pln_enable_setup(
  __setup("int_pln_enable", int_pln_enable_setup);
 =20
  #ifdef CONFIG_SYSFS
 +static int dpti_wait_for_ack(void)
 +{
 +	unsigned int count =3D 15000;
 +	u64 msr_val;
 +
 +	/*
 +	 * Hardware acknowledges the directed interrupt setup in 10ms or less.
 +	 * Wait 15ms to be safe.
 +	 */
 +	do {
- 		rdmsrq(MSR_IA32_PACKAGE_THERM_STATUS, msr_val);
++		msr_val =3D rdmsrq(MSR_IA32_PACKAGE_THERM_STATUS);
 +		udelay(1);
 +	} while (!(msr_val & PACKAGE_THERM_STATUS_DPTI_ACK) && --count);
 +
 +	if (!count)
 +		return -ETIMEDOUT;
 +
 +	thermal_clear_package_intr_status(PACKAGE_LEVEL,
 +					  PACKAGE_THERM_STATUS_DPTI_ACK);
 +
 +	return 0;
 +}
 +
 +static void dpti_config_this_cpu(bool enable)
 +{
 +	u64 msr_val;
 +
- 	rdmsrq(MSR_IA32_THERM_INTERRUPT, msr_val);
++	msr_val =3D rdmsrq(MSR_IA32_THERM_INTERRUPT);
 +
 +	if (enable)
 +		msr_val |=3D THERM_INT_DPTI_ENABLE;
 +	else
 +		msr_val &=3D ~THERM_INT_DPTI_ENABLE;
 +
 +	wrmsrq(MSR_IA32_THERM_INTERRUPT, msr_val);
 +}
 +
 +static void dpti_clear_ipi(void *unused)
 +{
 +	dpti_config_this_cpu(false);
 +}
 +
 +static void dpti_clear_on_cpu(unsigned int cpu)
 +{
 +	smp_call_function_single(cpu, dpti_clear_ipi, NULL, true);
 +}
 +
 +/* The unused argument matches the smp_call_on_cpu() callback signature. =
*/
 +static int dpti_program_this_cpu(void *unused)
 +{
 +	int ret;
 +
 +	thermal_clear_package_intr_status(PACKAGE_LEVEL,
 +					  PACKAGE_THERM_STATUS_DPTI_ACK);
 +
 +	dpti_config_this_cpu(true);
 +	ret =3D dpti_wait_for_ack();
 +	if (!ret)
 +		return 0;
 +
 +	/* Undo the enable on failure, leaving the package as it was before. */
 +	dpti_config_this_cpu(false);
 +
 +	return ret;
 +}
 +
 +/*
 + * MSR_IA32_PACKAGE_THERM_STATUS is package-scoped, so the acknowledgment=
 must
 + * be polled on the same package. Run a worker bound to @cpu: it cannot be
 + * migrated and may wait for the acknowledgment for as long as 15ms.
 + */
 +static int dpti_program_on_cpu(unsigned int cpu)
 +{
 +	lockdep_assert_cpus_held();
 +
 +	return smp_call_on_cpu(cpu, dpti_program_this_cpu, NULL, false);
 +}
 +
 +/**
 + * struct dpti_pkg - Per-package DPTI state
 + * @owner:	CPU currently programmed to receive the package-level
 + *		interrupt, or nr_cpu_ids when the package has no owner.
 + * @pin:	CPU the user requested as the owner, or nr_cpu_ids for
 + *		automatic selection. A pinned CPU overrides the automatic
 + *		selection whenever it is online.
 + */
 +struct dpti_pkg {
 +	unsigned int owner;
 +	unsigned int pin;
 +};
 +
 +/*
 + * Serializes updates to dpti_pkgs[] and dpti_shut_down. To avoid deadloc=
k, a
 + * path that needs both this mutex and the CPU hotplug lock always takes =
the
 + * hotplug lock first.
 + */
 +static DEFINE_MUTEX(dpti_mutex);
 +
 +static struct dpti_pkg *dpti_pkgs;
 +
 +/*
 + * Set under dpti_mutex by the syscore shutdown callback before it disabl=
es
 + * DPTI, so that no owner update enables it again on the way to kexec.
 + */
 +static bool dpti_shut_down;
 +
 +/*
 + * Cleared once the hotplug callbacks are registered: at least one CPU
 + * attempted the setup by then, and the hardware is assumed sane from that
 + * point on.
 + */
 +static bool dpti_in_boot __ro_after_init =3D true;
 +
 +static bool dpti_supported(void)
 +{
 +	if (!boot_cpu_has(X86_FEATURE_DPTI))
 +		return false;
 +
 +	if (!dpti_pkgs)
 +		return false;
 +
 +	return true;
 +}
 +
 +/* @pkg_id may be NULL for a caller that only validates @cpu. */
 +static int dpti_lookup_pkg_id(unsigned int cpu, u16 *pkg_id)
 +{
 +	u16 id;
 +
 +	if (!dpti_supported())
 +		return -ENODEV;
 +
 +	id =3D topology_logical_package_id(cpu);
 +	if (id >=3D topology_max_packages())
 +		return -ENODEV;
 +
 +	if (pkg_id)
 +		*pkg_id =3D id;
 +
 +	return 0;
 +}
 +
 +/* For callers already past dpti_lookup_pkg_id(). */
 +static struct dpti_pkg *dpti_pkg_of_cpu_nocheck(unsigned int cpu)
 +{
 +	return &dpti_pkgs[topology_logical_package_id(cpu)];
 +}
 +
 +/*
 + * Reads dpti_pkgs[] without dpti_mutex: the syscore callers run with
 + * interrupts disabled on the only online CPU.
 + */
 +static bool dpti_cpu_is_owner(unsigned int cpu)
 +{
 +	u16 pkg_id;
 +
 +	if (dpti_lookup_pkg_id(cpu, &pkg_id))
 +		return false;
 +
 +	return dpti_pkgs[pkg_id].owner =3D=3D cpu;
 +}
 +
 +/*
 + * Must be called with cpu_hotplug_lock held to prevent CPUs from going o=
ffline
 + * while iterating through packages and interrupts must be enabled to avo=
id
 + * deadlocks in SMP function calls. The syscore shutdown callback also ca=
lls
 + * this function, but runs with CPU hotplug disabled (and interrupts enab=
led).
 + */
 +static void dpti_clear_all(void)
 +{
 +	int i;
 +
 +	if (!dpti_supported())
 +		return;
 +
 +	guard(mutex)(&dpti_mutex);
 +
 +	/*
 +	 * No need to reset the owners: callers free dpti_pkgs[] or have shut
 +	 * DPTI down.
 +	 */
 +	for (i =3D 0; i < topology_max_packages(); i++) {
 +		unsigned int owner =3D dpti_pkgs[i].owner;
 +
 +		if (owner =3D=3D nr_cpu_ids)
 +			continue;
 +
 +		dpti_clear_on_cpu(owner);
 +	}
 +}
 +
 +/**
 + * enum dpti_rank - How suitable a CPU is as a DPTI owner
 + * @DPTI_RANK_NONE:		No eligible CPU.
 + * @DPTI_RANK_ISOLATED:		nohz_full-isolated (last resort).
 + * @DPTI_RANK_HOUSEKEEPING:	Not isolated (ideal automatic choice).
 + * @DPTI_RANK_PINNED:		Explicitly requested by the user; overrides any
 + *				automatic choice.
 + *
 + * Higher is better; the selection picks the highest-ranked online CPU in=
 the
 + * package.
 + */
 +enum dpti_rank {
 +	DPTI_RANK_NONE,
 +	DPTI_RANK_ISOLATED,
 +	DPTI_RANK_HOUSEKEEPING,
 +	DPTI_RANK_PINNED,
 +};
 +
 +static enum dpti_rank dpti_cpu_rank(unsigned int cpu)
 +{
 +	/*
 +	 * Prefer a HK_TYPE_KERNEL_NOISE CPU to avoid disturbing nohz_full
 +	 * isolated CPUs. The mask is boot-static. No locking needed.
 +	 */
 +	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
 +		return DPTI_RANK_HOUSEKEEPING;
 +
 +	return DPTI_RANK_ISOLATED;
 +}
 +
 +/*
 + * Select the owner of the package-level thermal interrupt for @pkg_cpu's
 + * package. @skip is excluded from the selection (e.g., if it is going of=
fline).
 + * @rank receives the rank of the selected CPU.
 + *
 + * A user-pinned CPU takes precedence whenever it is online; otherwise th=
e best
 + * ranked CPU in the package is chosen.
 + */
 +static unsigned int dpti_select_cpu(unsigned int pkg_cpu, unsigned int sk=
ip,
 +				    enum dpti_rank *rank)
 +{
 +	const struct cpumask *pkg_mask =3D topology_core_cpumask(pkg_cpu);
 +	enum dpti_rank best_rank =3D DPTI_RANK_NONE;
 +	unsigned int cpu, pin, best =3D nr_cpu_ids;
 +
 +	lockdep_assert_cpus_held();
 +	lockdep_assert_held(&dpti_mutex);
 +
 +	/*
 +	 * Choose the user-pinned CPU if available: it is online and not going
 +	 * offline (as indicated by @skip).
 +	 */
 +	pin =3D dpti_pkg_of_cpu_nocheck(pkg_cpu)->pin;
 +	if (pin < nr_cpu_ids && pin !=3D skip &&
 +	    cpumask_test_cpu(pin, pkg_mask)) {
 +		*rank =3D DPTI_RANK_PINNED;
 +		return pin;
 +	}
 +
 +	for_each_cpu(cpu, pkg_mask) {
 +		enum dpti_rank cpu_rank;
 +
 +		if (cpu =3D=3D skip)
 +			continue;
 +
 +		cpu_rank =3D dpti_cpu_rank(cpu);
 +		if (cpu_rank > best_rank) {
 +			best_rank =3D cpu_rank;
 +			best =3D cpu;
 +			/*
 +			 * Nothing outranks a housekeeping CPU in automatic
 +			 * selection.
 +			 */
 +			if (best_rank =3D=3D DPTI_RANK_HOUSEKEEPING)
 +				break;
 +		}
 +	}
 +
 +	*rank =3D best_rank;
 +
 +	return best;
 +}
 +
 +static void dpti_warn_if_isolated(unsigned int cpu, enum dpti_rank rank)
 +{
 +	if (rank =3D=3D DPTI_RANK_ISOLATED)
 +		pr_warn_once("Package %u thermal interrupt directed to nohz_full-isolat=
ed CPU%u; no housekeeping CPU available\n",
 +			     topology_logical_package_id(cpu), cpu);
 +}
 +
 +static void dpti_warn_if_pinned_isolated(unsigned int cpu)
 +{
 +	if (dpti_cpu_rank(cpu) =3D=3D DPTI_RANK_ISOLATED)
 +		pr_warn_ratelimited("Package %u thermal interrupt pinned to nohz_full-i=
solated CPU%u\n",
 +				    topology_logical_package_id(cpu), cpu);
 +}
 +
 +/*
 + * Reselect the owner for @cpu's package and migrate to it, but only on a
 + * strict rank improvement.
 + */
 +static int dpti_update_owner(unsigned int cpu)
 +{
 +	struct dpti_pkg *pkg =3D dpti_pkg_of_cpu_nocheck(cpu);
 +	enum dpti_rank new_rank, old_rank;
 +	unsigned int new_cpu, old_cpu;
 +	int ret;
 +
 +	lockdep_assert_held(&dpti_mutex);
 +
 +	if (dpti_shut_down)
 +		return 0;
 +
 +	old_cpu =3D pkg->owner;
 +	new_cpu =3D dpti_select_cpu(cpu, nr_cpu_ids, &new_rank);
 +	if (new_cpu =3D=3D old_cpu)
 +		return 0;
 +
 +	old_rank =3D DPTI_RANK_NONE;
 +	if (old_cpu < nr_cpu_ids)
 +		old_rank =3D dpti_cpu_rank(old_cpu);
 +	if (new_rank <=3D old_rank)
 +		return 0;
 +
 +	ret =3D dpti_program_on_cpu(new_cpu);
 +	if (ret) {
 +		if (old_cpu < nr_cpu_ids)
 +			pr_warn_once("Failed to redirect package thermal interrupt from CPU%u =
to CPU%u; keeping CPU%u\n",
 +				     old_cpu, new_cpu, old_cpu);
 +		return ret;
 +	}
 +
 +	if (old_cpu < nr_cpu_ids)
 +		dpti_clear_on_cpu(old_cpu);
 +
 +	pkg->owner =3D new_cpu;
 +	dpti_warn_if_isolated(new_cpu, new_rank);
 +
 +	return 0;
 +}
 +
 +static int dpti_online(unsigned int cpu)
 +{
 +	int ret;
 +
 +	if (!dpti_supported())
 +		return 0;
 +
 +	/*
 +	 * Validate @cpu's package id on behalf of dpti_update_owner(), which
 +	 * indexes dpti_pkgs[] based on @cpu.
 +	 */
 +	ret =3D dpti_lookup_pkg_id(cpu, NULL);
 +	if (ret)
 +		return ret;
 +
 +	guard(mutex)(&dpti_mutex);
 +
 +	/*
 +	 * A CPU coming online may be a better owner than the one currently
 +	 * programmed. If the hardware does not acknowledge it, the current
 +	 * owner keeps the interrupt: a valid outcome, already reported.
 +	 */
 +	ret =3D dpti_update_owner(cpu);
 +	if (ret && dpti_pkg_of_cpu_nocheck(cpu)->owner < nr_cpu_ids)
 +		return 0;
 +
 +	return ret;
 +}
 +
 +static void dpti_offline(unsigned int cpu)
 +{
 +	enum dpti_rank new_rank;
 +	unsigned int new_cpu;
 +	u16 pkg_id;
 +
 +	if (dpti_lookup_pkg_id(cpu, &pkg_id))
 +		return;
 +
 +	guard(mutex)(&dpti_mutex);
 +
 +	if (dpti_shut_down)
 +		return;
 +
 +	/* Not the owner of the directed interrupt. */
 +	if (dpti_pkgs[pkg_id].owner !=3D cpu)
 +		return;
 +
 +	/*
 +	 * The package-level interrupt must remain directed after this CPU goes
 +	 * offline.
 +	 */
 +	new_cpu =3D dpti_select_cpu(cpu, cpu, &new_rank);
 +
 +	/*
 +	 * dpti_program_on_cpu() undoes a setup that the hardware does not
 +	 * acknowledge on @new_cpu. With @cpu cleared below, no CPU is then
 +	 * configured to receive the package-level interrupt: all CPUs in the
 +	 * package receive it.
 +	 */
 +	if (new_cpu < nr_cpu_ids && dpti_program_on_cpu(new_cpu)) {
 +		pr_warn_once("Failed to redirect package thermal interrupt from CPU%u t=
o CPU%u; reverting to broadcast\n",
 +			     cpu, new_cpu);
 +
 +		new_cpu =3D nr_cpu_ids;
 +		new_rank =3D DPTI_RANK_NONE;
 +	}
 +
 +	/*
 +	 * Clear the directed interrupt on @cpu. Hardware acknowledgment can be
 +	 * ignored since @cpu is going offline.
 +	 */
 +	dpti_config_this_cpu(false);
 +
 +	dpti_pkgs[pkg_id].owner =3D new_cpu;
 +	dpti_warn_if_isolated(new_cpu, new_rank);
 +}
 +
 +/*
 + * The DPTI owner is a per-package property, but it is exposed through the
 + * existing per-CPU thermal_throttle sysfs group.
 + *
 + * Reading reports whether @cpu is the owner programmed in hardware, not
 + * whether it is pinned. A released pin therefore still reads 1 until the
 + * placement changes, and while a pinned CPU is offline the remaining CPUs
 + * report the automatically chosen fallback.
 + */
 +static ssize_t package_interrupt_owner_show(struct device *dev,
 +					    struct device_attribute *attr,
 +					    char *buf)
 +{
 +	unsigned int cpu =3D dev->id;
 +	bool is_owner;
 +	u16 pkg_id;
 +	int ret;
 +
 +	ret =3D dpti_lookup_pkg_id(cpu, &pkg_id);
 +	if (ret)
 +		return ret;
 +
 +	scoped_guard(mutex, &dpti_mutex)
 +		is_owner =3D dpti_pkgs[pkg_id].owner =3D=3D cpu;
 +
 +	return sysfs_emit(buf, "%u\n", is_owner);
 +}
 +
 +static int dpti_pin_owner(unsigned int cpu)
 +{
 +	struct dpti_pkg *pkg =3D dpti_pkg_of_cpu_nocheck(cpu);
 +	unsigned int old_pin;
 +	int ret;
 +
 +	guard(mutex)(&dpti_mutex);
 +
 +	/* The pin outranks every automatic choice, so it always migrates. */
 +	old_pin =3D pkg->pin;
 +	pkg->pin =3D cpu;
 +
 +	/*
 +	 * A failed write must not change policy or get silently retried on the
 +	 * next hotplug event.
 +	 */
 +	ret =3D dpti_update_owner(cpu);
 +	if (ret)
 +		pkg->pin =3D old_pin;
 +	else
 +		dpti_warn_if_pinned_isolated(cpu);
 +
 +	return ret;
 +}
 +
 +static void dpti_unpin_owner(unsigned int cpu)
 +{
 +	struct dpti_pkg *pkg =3D dpti_pkg_of_cpu_nocheck(cpu);
 +
 +	guard(mutex)(&dpti_mutex);
 +
 +	if (pkg->pin !=3D cpu)
 +		return;
 +
 +	pkg->pin =3D nr_cpu_ids;
 +
 +	/*
 +	 * Without the pin, a housekeeping CPU of the package outranks an
 +	 * isolated owner. Migrate rather than wait for a re-evaluation that may
 +	 * never come. A hardware acknowledgment failure leaves the interrupt in
 +	 * place, which is still a valid outcome of releasing a pin.
 +	 */
 +	dpti_update_owner(cpu);
 +}
 +
 +static ssize_t package_interrupt_owner_store(struct device *dev,
 +					     struct device_attribute *attr,
 +					     const char *buf, size_t count)
 +{
 +	unsigned int cpu =3D dev->id;
 +	bool want_pin;
 +	int ret;
 +
 +	ret =3D dpti_lookup_pkg_id(cpu, NULL);
 +	if (ret)
 +		return ret;
 +
 +	ret =3D kstrtobool(buf, &want_pin);
 +	if (ret)
 +		return ret;
 +
 +	/*
 +	 * The selection reads the package's online CPUs; the programming runs
 +	 * remotely on the CPU it picks. Both need the CPU hotplug lock, which
 +	 * this write cannot block on: offlining @cpu holds it while
 +	 * sysfs_remove_group() waits for this write to release its reference on
 +	 * the attribute. Restart the syscall instead, which drops that
 +	 * reference and lets the offline proceed. Avoid busy looping with a 5ms
 +	 * sleep between tries. lock_device_hotplug_sysfs() follows the same
 +	 * approach.
 +	 */
 +	if (!cpus_read_trylock()) {
 +		msleep(5);
 +		return restart_syscall();
 +	}
 +
 +	if (want_pin)
 +		ret =3D dpti_pin_owner(cpu);
 +	else
 +		dpti_unpin_owner(cpu);
 +
 +	cpus_read_unlock();
 +
 +	return ret ? ret : count;
 +}
 +static DEVICE_ATTR_RW(package_interrupt_owner);
 +
 +/*
 + * CPU0 may own the directed interrupt, but the CPU hotplug callbacks are=
 not
 + * called for CPU0 during suspend and resume.
 + */
 +static void dpti_syscore_resume(void *data)
 +{
 +	if (!dpti_cpu_is_owner(0))
 +		return;
 +
 +	if (!dpti_program_this_cpu(NULL))
 +		return;
 +
 +	/*
 +	 * Let another CPU take over via CPU hotplug. No lock is needed here:
 +	 * only CPU0 is online and interrupts are disabled.
 +	 */
 +	dpti_pkg_of_cpu_nocheck(0)->owner =3D nr_cpu_ids;
 +}
 +
 +static int dpti_syscore_suspend(void *data)
 +{
 +	if (dpti_cpu_is_owner(0))
 +		dpti_config_this_cpu(false);
 +
 +	return 0;
 +}
 +
 +static void dpti_syscore_shutdown(void *data)
 +{
 +	scoped_guard(mutex, &dpti_mutex)
 +		dpti_shut_down =3D true;
 +
 +	dpti_clear_all();
 +}
 +
 +static const struct syscore_ops dpti_syscore_ops =3D {
 +	.resume =3D dpti_syscore_resume,
 +	.suspend =3D dpti_syscore_suspend,
 +	.shutdown =3D dpti_syscore_shutdown,
 +};
 +
 +static struct syscore dpti_syscore =3D {
 +	.ops =3D &dpti_syscore_ops,
 +};
 +
 +static __init void dpti_init(void)
 +{
 +	int i;
 +
 +	if (!boot_cpu_has(X86_FEATURE_DPTI))
 +		return;
 +
 +	dpti_pkgs =3D kmalloc_objs(*dpti_pkgs, topology_max_packages());
 +	if (!dpti_pkgs)
 +		return;
 +
 +	for (i =3D 0; i < topology_max_packages(); i++) {
 +		dpti_pkgs[i].owner =3D nr_cpu_ids;
 +		dpti_pkgs[i].pin =3D nr_cpu_ids;
 +	}
 +
 +	register_syscore(&dpti_syscore);
 +}
 +
 +static void dpti_cleanup(void)
 +{
 +	unsigned int cpu;
 +
 +	if (!dpti_supported())
 +		return;
 +
 +	/* The attribute must not outlive the per-package state. */
 +	for_each_online_cpu(cpu)
 +		sysfs_remove_file_from_group(&get_cpu_device(cpu)->kobj,
 +					     &dev_attr_package_interrupt_owner.attr,
 +					     thermal_attr_group.name);
 +
 +	unregister_syscore(&dpti_syscore);
 +	dpti_clear_all();
 +	kfree(dpti_pkgs);
 +	dpti_pkgs =3D NULL;
 +}
 +
  /* Add/Remove thermal_throttle interface for CPU device: */
  static int thermal_throttle_add_dev(struct device *dev, unsigned int cpu)
  {

--xQrRqVnsR/JTQZh0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFteUACgkQJNaLcl1U
h9Alygf9HWjtEbSOcNAOa0/W1Ph5tjAziO5Cldzj9NbU+kl0+/J93QaCrFs57DzG
FF+23xU7tdEddfY/6IWWFtU+kAko3bGfESVcfeX0V56tZkIy5hePYnJ27RZdGkk4
6jGaul0jIMAoKPdnIAPylK/y8PA5PeUz3WLrG+EilsndGhCkbS1iltZD/H/7pFot
PtPBi5qVfj4dLDlmvN1FVCIWUYHBWb4sRWKAY5rxLhU1ACyjrRqMTd9hzMiIr/u8
qcTkGEYV4gxi+G5MCPp51i/rQFBtgwURH3DFNUN5SVZhv953cy3cJaGLw5EtMtse
8CZMmc0Sp/QtGtGg1T9Mwq2HB9rv8Q==
=nNa8
-----END PGP SIGNATURE-----

--xQrRqVnsR/JTQZh0--
