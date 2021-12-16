module.exports = (property) => `
    /**
     * ${property.getterDescription()}
     *
     * @return  ${property.getType() ? property.getType() : 'mixed'}
     */
    public function ${property.getterName()}() {
        return $this->${property.getName()};
    }
`
